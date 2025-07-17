import sys
import locale

print("sys.getdefaultencoding():", sys.getdefaultencoding())
print("locale.getpreferredencoding():", locale.getpreferredencoding())
print("sys.stdin.encoding:", sys.stdin.encoding)
print("sys.stdout.encoding:", sys.stdout.encoding)
