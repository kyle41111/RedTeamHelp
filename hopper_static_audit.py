#
# Hopper Python script for static triage of macOS apps.
# Run inside Hopper with the target Mach-O loaded.
#

TARGETS = [
    "system",
    "popen",
    "execve",
    "execl",
    "execvp",
    "NSTask",
    "AuthorizationExecuteWithPrivileges",
    "NSXPCConnection",
    "xpc_connection_set_event_handler",
    "xpc_connection_create_mach_service",
    "listener:shouldAcceptNewConnection:",
    "setExportedObject:",
    "setExportedInterface:",
    "strcpy",
    "strcat",
    "sprintf",
    "vsprintf",
    "memcpy",
    "mktemp",
    "tmpnam",
    "sqlite3_exec",
    "dlopen",
    "dlsym",
    "chmod",
    "chown",
    "open",
    "unlink",
]


def iter_procedures(doc):
    for seg in doc.getSegmentsList():
        for proc in seg.getProceduresList():
            yield proc


def emit(msg):
    print(msg)


def safe_name(obj):
    try:
        return obj.getName()
    except Exception:
        return "<unnamed>"


def find_matching_procedures(doc, targets):
    hits = []
    lowered = [t.lower() for t in targets]
    for proc in iter_procedures(doc):
        name = safe_name(proc)
        lname = name.lower()
        if any(t in lname for t in lowered):
            hits.append(proc)
    return hits


def find_matching_strings(doc, targets):
    hits = []
    lowered = [t.lower() for t in targets]
    for s in doc.getStrings():
        try:
            text = s.getString()
        except Exception:
            continue
        ltext = text.lower()
        if any(t in ltext for t in lowered):
            hits.append(s)
    return hits


def dump_xrefs(doc, addr):
    try:
        xrefs = doc.getXRefsToAddress(addr)
    except Exception as exc:
        emit("    [xref lookup failed: %s]" % exc)
        return

    seen = set()
    for xref in xrefs:
        try:
            from_addr = xref.fromAddress()
        except Exception:
            continue
        if from_addr in seen:
            continue
        seen.add(from_addr)
        emit("    XREF from 0x%x" % from_addr)


def main():
    doc = Document.getCurrentDocument()
    if doc is None:
        emit("No Hopper document is open.")
        return

    emit("== Matching Procedures ==")
    procs = find_matching_procedures(doc, TARGETS)
    if not procs:
        emit("  No matching procedures found.")
    for proc in procs:
        addr = proc.getEntryPoint()
        name = safe_name(proc)
        emit("[PROC] 0x%x %s" % (addr, name))
        dump_xrefs(doc, addr)

    emit("")
    emit("== Matching Strings ==")
    strings = find_matching_strings(doc, TARGETS)
    if not strings:
        emit("  No matching strings found.")
    for s in strings:
        try:
            emit("[STR]  0x%x %s" % (s.getAddress(), s.getString()))
        except Exception:
            pass


if __name__ == "__main__":
    main()
