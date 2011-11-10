CC= raco exe
CP= cp -f
MV= mv -f
RMDIR= rm -rf

SYSTEMAPP= /Applications
TARGET= Konsulta\ Vortaro.app
SOURCES= Source
SOURCE= $(SOURCES)/run.ss
RESOURCES= Resources
ICNS= $(RESOURCES)/Starter.icns
INFO= Info.plist
FLAGS= --vv --gui --icns $(ICNS)
CLIBS= --orig-exe --3m


#-----------------------------------------------------------------------
all: $(TARGET)


clean: $(TARGET)
	$(RMDIR) "$<"


test: $(SOURCES)/test.ss
	"$<"


run: $(TARGET)
	open "$<"


install: $(TARGET) uninstall
	$(MV) "$<" "$(SYSTEMAPP)/"


uninstall:
	$(RMDIR) "$(SYSTEMAPP)/"$(TARGET)


$(TARGET): $(SOURCE)
	$(CC) $(FLAGS) $(CLIBS) -o "$@" "$<"
	$(CP) "$(RESOURCES)"/* "$@/Contents/$(RESOURCES)/"
	$(CP) "$(INFO)" "$@/Contents/$(INFO)"
