Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 0D5471A03CA
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2015 14:42:32 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445398950439648.338908817484;
 Tue, 20 Oct 2015 20:42:30 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-hwmon] Initial read-daemon for hwmon entries
Date: Tue, 20 Oct 2015 22:42:23 -0500
Message-Id: <1445398943-1310-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445398943-1310-1-git-send-email-patches@stwcx.xyz>
References: <1445398943-1310-1-git-send-email-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Oct 2015 03:42:33 -0000

From: Patrick Williams <patrick@stwcx.xyz>

Discoveres hwmon entries for fans, input voltage, and temperature
sensors.  Polls entries on a 1s interval and displays a message to
stdout if one of the entries have changed.
---
 Makefile      | 60 +++++++++++++++++++++++++++++++++++++++++++++
 README.md     |  3 +++
 argument.C    | 57 ++++++++++++++++++++++++++++++++++++++++++
 argument.H    | 28 +++++++++++++++++++++
 directory.C   | 38 ++++++++++++++++++++++++++++
 directory.H   | 20 +++++++++++++++
 hwmon.H       | 23 +++++++++++++++++
 readd.C       | 79 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 sensorcache.H | 27 ++++++++++++++++++++
 sensorset.C   | 26 ++++++++++++++++++++
 sensorset.H   | 31 +++++++++++++++++++++++
 sysfs.H       | 31 +++++++++++++++++++++++
 12 files changed, 423 insertions(+)
 create mode 100644 Makefile
 create mode 100644 README.md
 create mode 100644 argument.C
 create mode 100644 argument.H
 create mode 100644 directory.C
 create mode 100644 directory.H
 create mode 100644 hwmon.H
 create mode 100644 readd.C
 create mode 100644 sensorcache.H
 create mode 100644 sensorset.C
 create mode 100644 sensorset.H
 create mode 100644 sysfs.H

diff --git a/Makefile b/Makefile
new file mode 100644
index 0000000..49a7e4d
--- /dev/null
+++ b/Makefile
@@ -0,0 +1,60 @@
+LIBS += libphosphor-hwmon.so
+libphosphor-hwmon.so_OBJS += argument.o
+libphosphor-hwmon.so_OBJS += directory.o
+libphosphor-hwmon.so_OBJS += sensorset.o
+
+EXES += phosphor-hwmon-readd
+phosphor-hwmon-readd_OBJS += readd.o
+phosphor-hwmon-readd_LIBS += phosphor-hwmon
+
+#TODO: Issue#1 - Add the write-daemon for fan, pwm control.
+#EXES += phosphor-hwmon-writed
+#phosphor-hwmon-writed_OBJS += writed.o
+#phosphor-hwmon-writed_LIBS += phosphor-hwmon
+
+#### -----------------------------------------------------------------------####
+#                                                                              #
+##                       Compilare Regulas Sequi                              ##
+#                                                                              #
+#### -----------------------------------------------------------------------####
+
+CXXFLAGS ?= -O3 -g -pipe
+CXXFLAGS += --std=gnu++14 -Wall -flto -fPIC
+
+define __BUILD_EXE
+$1 : $$($1_OBJS) $$(LIBS)
+		$$(LINK.cpp) -o $$@ $$^
+
+#include $$($1_OBJS:.o=.d)
+endef
+
+$(foreach exe,$(EXES),$(eval $(call __BUILD_EXE,$(exe))))
+
+define __BUILD_LIB
+$1 : $$($1_OBJS)
+		$$(LINK.cpp) -shared -o $$@ $$^
+
+#include $$($1_OBJS:.o=.d)
+endef
+
+$(foreach lib,$(LIBS),$(eval $(call __BUILD_LIB,$(lib))))
+
+.PHONY: clean
+clean:
+		$(RM) $(foreach exe,$(EXES),$(exe) $($(exe)_OBJS)) \
+			  $(foreach lib,$(LIBS),$(lib) $($(lib)_OBJS))
+
+DESTDIR ?= /
+BINDIR ?= /usr/bin
+LIBDIR ?= /usr/lib
+
+.PHONY: install
+install:
+		install -m 0755 -d $(DESTDIR)$(BINDIR)
+		install -m 0755 $(EXES) $(DESTDIR)$(BINDIR)
+		install -m 0755 -d $(DESTDIR)$(LIBDIR)
+		install -m 0755 $(LIBS) $(DESTDIR)$(LIBDIR)
+
+.DEFAULT_GOAL: all
+.PHONY: all
+all: $(EXES) $(LIBS)
diff --git a/README.md b/README.md
new file mode 100644
index 0000000..88122e6
--- /dev/null
+++ b/README.md
@@ -0,0 +1,3 @@
+= phosphor-hwmon =
+
+Exposes generic hwmon entries as DBus objects.
diff --git a/argument.C b/argument.C
new file mode 100644
index 0000000..15c258e
--- /dev/null
+++ b/argument.C
@@ -0,0 +1,57 @@
+#include <iostream>
+#include <iterator>
+#include <algorithm>
+#include <cassert>
+#include "argument.H"
+
+ArgumentParser::ArgumentParser(int argc, char** argv)
+{
+    int option = 0;
+    while(-1 != (option = getopt_long(argc, argv, optionstr, options, NULL)))
+    {
+        if ((option == '?') || (option == 'h'))
+        {
+            usage(argv);
+            exit(-1);
+        }
+
+        auto i = &options[0];
+        while ((i->val != option) && (i->val != 0)) ++i;
+
+        if (i->val)
+            arguments[i->name] = (i->has_arg ? optarg : true_string);
+    }
+}
+
+const std::string& ArgumentParser::operator[](const std::string& opt)
+{
+    auto i = arguments.find(opt);
+    if (i == arguments.end())
+    {
+        return empty_string;
+    }
+    else
+    {
+        return i->second;
+    }
+}
+
+void ArgumentParser::usage(char** argv)
+{
+    std::cerr << "Usage: " << argv[0] << " [options]" << std::endl;
+    std::cerr << "Options:" << std::endl;
+    std::cerr << "    --path=<path>        sysfs location to monitor"
+              << std::endl;
+}
+
+const option ArgumentParser::options[] =
+{
+    { "path",   required_argument,  NULL,   'p' },
+    { "help",   no_argument,        NULL,   'h' },
+    { 0, 0, 0, 0},
+};
+
+const char* ArgumentParser::optionstr = "p:?h";
+
+const std::string ArgumentParser::true_string = "true";
+const std::string ArgumentParser::empty_string = "";
diff --git a/argument.H b/argument.H
new file mode 100644
index 0000000..252fc36
--- /dev/null
+++ b/argument.H
@@ -0,0 +1,28 @@
+#ifndef __ARGUMENT_H
+#define __ARGUMENT_H
+#include <getopt.h>
+#include <map>
+#include <string>
+
+class ArgumentParser
+{
+    public:
+        ArgumentParser(int argc, char** argv);
+        const std::string& operator[](const std::string& opt);
+
+        static void usage(char** argv);
+
+        static const std::string true_string;
+        static const std::string empty_string;
+
+    private:
+        std::map<const std::string, std::string> arguments;
+
+        static const option options[];
+        static const char* optionstr;
+
+    private:
+        ArgumentParser() {};
+};
+
+#endif
diff --git a/directory.C b/directory.C
new file mode 100644
index 0000000..5be9ff1
--- /dev/null
+++ b/directory.C
@@ -0,0 +1,38 @@
+#include <cerrno>
+#include <cstring>
+#include <iostream>
+#include "directory.H"
+
+Directory::Directory(const std::string& path) : entry(nullptr)
+{
+    dirp = opendir(path.c_str());
+    if (NULL == dirp)
+    {
+        auto e = errno;
+        std::cerr << "Error opening directory " << path.c_str()
+                  << " : " << strerror(e) << std::endl;
+    }
+}
+
+Directory::~Directory()
+{
+    if (dirp)
+    {
+        closedir(dirp);
+    }
+}
+
+bool Directory::next(std::string& name)
+{
+    if (!dirp) return false;
+
+    dirent entry;
+    dirent* result;
+
+    auto rc = readdir_r(dirp, &entry, &result);
+
+    if ((rc) || (NULL == result)) return false;
+
+    name = entry.d_name;
+    return true;
+}
diff --git a/directory.H b/directory.H
new file mode 100644
index 0000000..1b085c5
--- /dev/null
+++ b/directory.H
@@ -0,0 +1,20 @@
+#ifndef __DIRECTORY_H
+#define __DIRECTORY_H
+
+#include <string>
+#include <dirent.h>
+
+class Directory
+{
+    public:
+        explicit Directory(const std::string& path);
+        ~Directory();
+
+        bool next(std::string& name);
+
+    private:
+        dirent* entry;
+        DIR* dirp;
+};
+
+#endif
diff --git a/hwmon.H b/hwmon.H
new file mode 100644
index 0000000..494d38e
--- /dev/null
+++ b/hwmon.H
@@ -0,0 +1,23 @@
+#ifndef __HWMON_H
+#define __HWMON_H
+
+#include <string>
+
+namespace hwmon
+{
+    using namespace std::literals;
+
+    namespace entry
+    {
+        static const std::string input = "input"s;
+    }
+
+    namespace type
+    {
+        static const std::string fan = "fan"s;
+        static const std::string temp = "temp"s;
+        static const std::string volt = "in"s;
+    }
+}
+
+#endif
diff --git a/readd.C b/readd.C
new file mode 100644
index 0000000..467ecbf
--- /dev/null
+++ b/readd.C
@@ -0,0 +1,79 @@
+#include <iostream>
+#include <memory>
+#include <thread>
+#include "argument.H"
+#include "sensorset.H"
+#include "sensorcache.H"
+#include "hwmon.H"
+#include "sysfs.H"
+
+static void exit_with_error(const char* err, char** argv)
+{
+    ArgumentParser::usage(argv);
+    std::cerr << std::endl;
+    std::cerr << "ERROR: " << err << std::endl;
+    exit(-1);
+}
+
+int main(int argc, char** argv)
+{
+    // Read arguments.
+    auto options = std::make_unique<ArgumentParser>(argc, argv);
+
+    // Parse out path argument.
+    auto path = (*options)["path"];
+    if (path == ArgumentParser::empty_string)
+    {
+        exit_with_error("Path not specified.", argv);
+    }
+
+    // Finished getting options out, so release the parser.
+    options.release();
+
+    // Check sysfs for available sensors.
+    auto sensors = std::make_unique<SensorSet>(path);
+    auto sensor_cache = std::make_unique<SensorCache>();
+
+    // TODO: Issue#3 - Need to make calls to the dbus sensor cache here to
+    //       ensure the objects all exist?
+
+    // Polling loop.
+    while(true)
+    {
+        // Iterate through all the sensors.
+        for(auto& i : *sensors)
+        {
+            if (i.second.find(hwmon::entry::input) != i.second.end())
+            {
+                // Read value from sensor.
+                int value = 0;
+                read_sysfs(make_sysfs_path(path,
+                                           i.first.first, i.first.second,
+                                           hwmon::entry::input),
+                           value);
+
+                // Update sensor cache.
+                if (sensor_cache->update(i.first, value))
+                {
+                    // TODO: Issue#4 - dbus event here.
+                    std::cout << i.first.first << i.first.second << " = "
+                              << value << std::endl;
+                }
+            }
+        }
+
+        // Sleep until next interval.
+        // TODO: Issue#5 - Make this configurable.
+        // TODO: Issue#6 - Optionally look at polling interval sysfs entry.
+        {
+            using namespace std::literals::chrono_literals;
+            std::this_thread::sleep_for(1s);
+        }
+
+        // TODO: Issue#7 - Should probably periodically check the SensorSet
+        //       for new entries.
+    }
+
+    return 0;
+}
+
diff --git a/sensorcache.H b/sensorcache.H
new file mode 100644
index 0000000..64333d8
--- /dev/null
+++ b/sensorcache.H
@@ -0,0 +1,27 @@
+#ifndef __SENSORCACHE_H
+#define __SENSORCACHE_H
+
+#include <map>
+
+class SensorCache
+{
+    public:
+        typedef std::map<std::pair<std::string, std::string>,
+                         int> container_t;
+
+        bool update(const container_t::key_type& k,
+                    const container_t::mapped_type& v)
+        {
+            auto& i = container[k];
+            if (v == i) return false;
+            else
+            {
+                i = v;
+                return true;
+            }
+        }
+    private:
+        container_t container;
+};
+
+#endif
diff --git a/sensorset.C b/sensorset.C
new file mode 100644
index 0000000..8b59ac1
--- /dev/null
+++ b/sensorset.C
@@ -0,0 +1,26 @@
+#include <regex>
+#include <iostream>
+#include "sensorset.H"
+#include "directory.H"
+
+// TODO: Issue#2 - STL regex generates really bloated code.  Use POSIX regex
+//       interfaces instead.
+static const std::regex sensors_regex =
+    std::regex("^(fan|in|temp)([0-9]+)_([a-z]*)", std::regex::extended);
+static const auto sensor_regex_match_count = 4;
+
+SensorSet::SensorSet(const std::string& path)
+{
+    Directory d(path);
+    std::string file;
+
+    while(d.next(file))
+    {
+        std::smatch match;
+        std::regex_search(file, match, sensors_regex);
+
+        if (match.size() != sensor_regex_match_count) continue;
+
+        container[make_pair(match[1],match[2])].emplace(match[3]);
+    }
+}
diff --git a/sensorset.H b/sensorset.H
new file mode 100644
index 0000000..beb8446
--- /dev/null
+++ b/sensorset.H
@@ -0,0 +1,31 @@
+#ifndef __SENSORSET_H
+#define __SENSORSET_H
+
+#include <map>
+#include <set>
+#include <string>
+
+class SensorSet
+{
+    public:
+        typedef std::map<std::pair<std::string, std::string>,
+                         std::set<std::string>> container_t;
+
+        SensorSet(const std::string& path);
+
+        container_t::const_iterator begin()
+        {
+            return const_cast<const container_t&>(container).begin();
+        }
+
+        container_t::const_iterator end()
+        {
+            return const_cast<const container_t&>(container).end();
+        }
+
+    private:
+        container_t container;
+
+};
+
+#endif
diff --git a/sysfs.H b/sysfs.H
new file mode 100644
index 0000000..d073d77
--- /dev/null
+++ b/sysfs.H
@@ -0,0 +1,31 @@
+#ifndef __SYSFS_H
+#define __SYSFS_H
+
+#include <fstream>
+#include <string>
+
+template <typename T>
+void read_sysfs(const std::string& path, T& val)
+{
+    std::ifstream s(path);
+    s >> val;
+}
+
+template <typename T>
+void write_sysfs(const std::string& path, const T& val)
+{
+    std::ofstream s(path);
+    s << val;
+}
+
+const std::string make_sysfs_path(const std::string& path,
+                                  const std::string& type,
+                                  const std::string& id,
+                                  const std::string& entry)
+{
+    using namespace std::literals;
+
+    return path + "/"s + type + id + "_"s + entry;
+}
+
+#endif
-- 
2.6.0
