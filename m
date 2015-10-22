Return-Path: <brad@bwbmail.net>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id CFF411A06C9
 for <openbmc@lists.ozlabs.org>; Thu, 22 Oct 2015 11:41:54 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Subject: Re: [PATCH phosphor-hwmon] Initial read-daemon for hwmon entries
From: Brad Bishop <brad@bwbmail.net>
In-Reply-To: <1445398943-1310-2-git-send-email-patches@stwcx.xyz>
Date: Wed, 21 Oct 2015 20:41:49 -0400
Cc: openbmc@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <AF771FD1-A10A-485E-B783-AD73D11A80E2@bwbmail.net>
References: <1445398943-1310-1-git-send-email-patches@stwcx.xyz>
 <1445398943-1310-2-git-send-email-patches@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 00:41:55 -0000


> On Oct 20, 2015, at 11:42 PM, OpenBMC Patches <patches@stwcx.xyz> =
wrote:
>=20
> From: Patrick Williams <patrick@stwcx.xyz>
>=20
> Discoveres hwmon entries for fans, input voltage, and temperature

Discovers

> sensors.  Polls entries on a 1s interval and displays a message to
> stdout if one of the entries have changed.
> ---
> Makefile      | 60 +++++++++++++++++++++++++++++++++++++++++++++
> README.md     |  3 +++
> argument.C    | 57 ++++++++++++++++++++++++++++++++++++++++++
> argument.H    | 28 +++++++++++++++++++++
> directory.C   | 38 ++++++++++++++++++++++++++++
> directory.H   | 20 +++++++++++++++
> hwmon.H       | 23 +++++++++++++++++
> readd.C       | 79 =
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
> sensorcache.H | 27 ++++++++++++++++++++
> sensorset.C   | 26 ++++++++++++++++++++
> sensorset.H   | 31 +++++++++++++++++++++++
> sysfs.H       | 31 +++++++++++++++++++++++
> 12 files changed, 423 insertions(+)
> create mode 100644 Makefile
> create mode 100644 README.md
> create mode 100644 argument.C
> create mode 100644 argument.H
> create mode 100644 directory.C
> create mode 100644 directory.H
> create mode 100644 hwmon.H
> create mode 100644 readd.C
> create mode 100644 sensorcache.H
> create mode 100644 sensorset.C
> create mode 100644 sensorset.H
> create mode 100644 sysfs.H
>=20
> diff --git a/Makefile b/Makefile
> new file mode 100644
> index 0000000..49a7e4d
> --- /dev/null
> +++ b/Makefile
> @@ -0,0 +1,60 @@
> +LIBS +=3D libphosphor-hwmon.so
> +libphosphor-hwmon.so_OBJS +=3D argument.o
> +libphosphor-hwmon.so_OBJS +=3D directory.o

So if I want to use this directory utility can I just link my =
application to libphosphor-hwmon?

> +libphosphor-hwmon.so_OBJS +=3D sensorset.o
> +
> +EXES +=3D phosphor-hwmon-readd
> +phosphor-hwmon-readd_OBJS +=3D readd.o
> +phosphor-hwmon-readd_LIBS +=3D phosphor-hwmon
> +
> +#TODO: Issue#1 - Add the write-daemon for fan, pwm control.
> +#EXES +=3D phosphor-hwmon-writed
> +#phosphor-hwmon-writed_OBJS +=3D writed.o
> +#phosphor-hwmon-writed_LIBS +=3D phosphor-hwmon
> +
> +#### =
-----------------------------------------------------------------------###=
#
> +#                                                                     =
         #
> +##                       Compilare Regulas Sequi                      =
        ##
> +#                                                                     =
         #
> +#### =
-----------------------------------------------------------------------###=
#
> +
> +CXXFLAGS ?=3D -O3 -g -pipe
> +CXXFLAGS +=3D --std=3Dgnu++14 -Wall -flto -fPIC
> +
> +define __BUILD_EXE
> +$1 : $$($1_OBJS) $$(LIBS)
> +		$$(LINK.cpp) -o $$@ $$^
> +
> +#include $$($1_OBJS:.o=3D.d)
> +endef
> +
> +$(foreach exe,$(EXES),$(eval $(call __BUILD_EXE,$(exe))))
> +
> +define __BUILD_LIB
> +$1 : $$($1_OBJS)
> +		$$(LINK.cpp) -shared -o $$@ $$^
> +
> +#include $$($1_OBJS:.o=3D.d)
> +endef
> +
> +$(foreach lib,$(LIBS),$(eval $(call __BUILD_LIB,$(lib))))
> +
> +.PHONY: clean
> +clean:
> +		$(RM) $(foreach exe,$(EXES),$(exe) $($(exe)_OBJS)) \
> +			  $(foreach lib,$(LIBS),$(lib) $($(lib)_OBJS))
> +
> +DESTDIR ?=3D /
> +BINDIR ?=3D /usr/bin
> +LIBDIR ?=3D /usr/lib
> +
> +.PHONY: install
> +install:
> +		install -m 0755 -d $(DESTDIR)$(BINDIR)
> +		install -m 0755 $(EXES) $(DESTDIR)$(BINDIR)
> +		install -m 0755 -d $(DESTDIR)$(LIBDIR)
> +		install -m 0755 $(LIBS) $(DESTDIR)$(LIBDIR)
> +
> +.DEFAULT_GOAL: all
> +.PHONY: all
> +all: $(EXES) $(LIBS)
> diff --git a/README.md b/README.md
> new file mode 100644
> index 0000000..88122e6
> --- /dev/null
> +++ b/README.md
> @@ -0,0 +1,3 @@
> +=3D phosphor-hwmon =3D
> +
> +Exposes generic hwmon entries as DBus objects.
> diff --git a/argument.C b/argument.C
> new file mode 100644
> index 0000000..15c258e
> --- /dev/null
> +++ b/argument.C
> @@ -0,0 +1,57 @@
> +#include <iostream>
> +#include <iterator>
> +#include <algorithm>
> +#include <cassert>
> +#include "argument.H"
> +
> +ArgumentParser::ArgumentParser(int argc, char** argv)
> +{
> +    int option =3D 0;
> +    while(-1 !=3D (option =3D getopt_long(argc, argv, optionstr, =
options, NULL)))
> +    {
> +        if ((option =3D=3D '?') || (option =3D=3D 'h'))
> +        {
> +            usage(argv);
> +            exit(-1);
> +        }
> +
> +        auto i =3D &options[0];
> +        while ((i->val !=3D option) && (i->val !=3D 0)) ++i;
> +
> +        if (i->val)
> +            arguments[i->name] =3D (i->has_arg ? optarg : =
true_string);
> +    }
> +}
> +
> +const std::string& ArgumentParser::operator[](const std::string& opt)
> +{
> +    auto i =3D arguments.find(opt);
> +    if (i =3D=3D arguments.end())
> +    {
> +        return empty_string;
> +    }
> +    else
> +    {
> +        return i->second;
> +    }
> +}
> +
> +void ArgumentParser::usage(char** argv)
> +{
> +    std::cerr << "Usage: " << argv[0] << " [options]" << std::endl;
> +    std::cerr << "Options:" << std::endl;
> +    std::cerr << "    --path=3D<path>        sysfs location to =
monitor"
> +              << std::endl;
> +}
> +
> +const option ArgumentParser::options[] =3D
> +{
> +    { "path",   required_argument,  NULL,   'p' },
> +    { "help",   no_argument,        NULL,   'h' },
> +    { 0, 0, 0, 0},
> +};
> +
> +const char* ArgumentParser::optionstr =3D "p:?h";
> +
> +const std::string ArgumentParser::true_string =3D "true";
> +const std::string ArgumentParser::empty_string =3D "";
> diff --git a/argument.H b/argument.H
> new file mode 100644
> index 0000000..252fc36
> --- /dev/null
> +++ b/argument.H
> @@ -0,0 +1,28 @@
> +#ifndef __ARGUMENT_H
> +#define __ARGUMENT_H
> +#include <getopt.h>
> +#include <map>
> +#include <string>
> +
> +class ArgumentParser
> +{
> +    public:
> +        ArgumentParser(int argc, char** argv);
> +        const std::string& operator[](const std::string& opt);
> +
> +        static void usage(char** argv);
> +
> +        static const std::string true_string;
> +        static const std::string empty_string;
> +
> +    private:
> +        std::map<const std::string, std::string> arguments;
> +
> +        static const option options[];
> +        static const char* optionstr;
> +
> +    private:
> +        ArgumentParser() {};
> +};
> +
> +#endif
> diff --git a/directory.C b/directory.C
> new file mode 100644
> index 0000000..5be9ff1
> --- /dev/null
> +++ b/directory.C
> @@ -0,0 +1,38 @@
> +#include <cerrno>
> +#include <cstring>
> +#include <iostream>
> +#include "directory.H"
> +
> +Directory::Directory(const std::string& path) : entry(nullptr)
> +{
> +    dirp =3D opendir(path.c_str());
> +    if (NULL =3D=3D dirp)
> +    {
> +        auto e =3D errno;
> +        std::cerr << "Error opening directory " << path.c_str()
> +                  << " : " << strerror(e) << std::endl;
> +    }
> +}
> +
> +Directory::~Directory()
> +{
> +    if (dirp)
> +    {
> +        closedir(dirp);
> +    }
> +}
> +
> +bool Directory::next(std::string& name)
> +{
> +    if (!dirp) return false;
> +
> +    dirent entry;
> +    dirent* result;
> +
> +    auto rc =3D readdir_r(dirp, &entry, &result);
> +
> +    if ((rc) || (NULL =3D=3D result)) return false;
> +
> +    name =3D entry.d_name;
> +    return true;
> +}
> diff --git a/directory.H b/directory.H
> new file mode 100644
> index 0000000..1b085c5
> --- /dev/null
> +++ b/directory.H
> @@ -0,0 +1,20 @@
> +#ifndef __DIRECTORY_H
> +#define __DIRECTORY_H
> +
> +#include <string>
> +#include <dirent.h>
> +
> +class Directory
> +{
> +    public:
> +        explicit Directory(const std::string& path);
> +        ~Directory();
> +
> +        bool next(std::string& name);
> +
> +    private:
> +        dirent* entry;
> +        DIR* dirp;
> +};
> +
> +#endif
> diff --git a/hwmon.H b/hwmon.H
> new file mode 100644
> index 0000000..494d38e
> --- /dev/null
> +++ b/hwmon.H
> @@ -0,0 +1,23 @@
> +#ifndef __HWMON_H
> +#define __HWMON_H
> +
> +#include <string>
> +
> +namespace hwmon
> +{
> +    using namespace std::literals;
> +
> +    namespace entry
> +    {
> +        static const std::string input =3D "input"s;
> +    }
> +
> +    namespace type
> +    {
> +        static const std::string fan =3D "fan"s;
> +        static const std::string temp =3D "temp"s;
> +        static const std::string volt =3D "in"s;
> +    }
> +}
> +
> +#endif
> diff --git a/readd.C b/readd.C
> new file mode 100644
> index 0000000..467ecbf
> --- /dev/null
> +++ b/readd.C
> @@ -0,0 +1,79 @@
> +#include <iostream>
> +#include <memory>
> +#include <thread>
> +#include "argument.H"
> +#include "sensorset.H"
> +#include "sensorcache.H"
> +#include "hwmon.H"
> +#include "sysfs.H"
> +
> +static void exit_with_error(const char* err, char** argv)
> +{
> +    ArgumentParser::usage(argv);
> +    std::cerr << std::endl;
> +    std::cerr << "ERROR: " << err << std::endl;
> +    exit(-1);
> +}
> +
> +int main(int argc, char** argv)
> +{
> +    // Read arguments.
> +    auto options =3D std::make_unique<ArgumentParser>(argc, argv);
> +
> +    // Parse out path argument.
> +    auto path =3D (*options)["path"];
> +    if (path =3D=3D ArgumentParser::empty_string)
> +    {
> +        exit_with_error("Path not specified.", argv);
> +    }
> +
> +    // Finished getting options out, so release the parser.
> +    options.release();
> +
> +    // Check sysfs for available sensors.
> +    auto sensors =3D std::make_unique<SensorSet>(path);
> +    auto sensor_cache =3D std::make_unique<SensorCache>();
> +
> +    // TODO: Issue#3 - Need to make calls to the dbus sensor cache =
here to
> +    //       ensure the objects all exist?
> +
> +    // Polling loop.
> +    while(true)
> +    {
> +        // Iterate through all the sensors.
> +        for(auto& i : *sensors)
> +        {
> +            if (i.second.find(hwmon::entry::input) !=3D =
i.second.end())
> +            {
> +                // Read value from sensor.
> +                int value =3D 0;
> +                read_sysfs(make_sysfs_path(path,
> +                                           i.first.first, =
i.first.second,
> +                                           hwmon::entry::input),
> +                           value);
> +
> +                // Update sensor cache.
> +                if (sensor_cache->update(i.first, value))
> +                {
> +                    // TODO: Issue#4 - dbus event here.
> +                    std::cout << i.first.first << i.first.second << " =
=3D "
> +                              << value << std::endl;
> +                }
> +            }
> +        }
> +
> +        // Sleep until next interval.
> +        // TODO: Issue#5 - Make this configurable.
> +        // TODO: Issue#6 - Optionally look at polling interval sysfs =
entry.
> +        {
> +            using namespace std::literals::chrono_literals;
> +            std::this_thread::sleep_for(1s);
> +        }
> +
> +        // TODO: Issue#7 - Should probably periodically check the =
SensorSet
> +        //       for new entries.
> +    }
> +
> +    return 0;
> +}
> +
> diff --git a/sensorcache.H b/sensorcache.H
> new file mode 100644
> index 0000000..64333d8
> --- /dev/null
> +++ b/sensorcache.H
> @@ -0,0 +1,27 @@
> +#ifndef __SENSORCACHE_H
> +#define __SENSORCACHE_H
> +
> +#include <map>
> +
> +class SensorCache
> +{
> +    public:
> +        typedef std::map<std::pair<std::string, std::string>,
> +                         int> container_t;
> +
> +        bool update(const container_t::key_type& k,
> +                    const container_t::mapped_type& v)
> +        {
> +            auto& i =3D container[k];
> +            if (v =3D=3D i) return false;
> +            else
> +            {
> +                i =3D v;
> +                return true;
> +            }
> +        }
> +    private:
> +        container_t container;
> +};
> +
> +#endif
> diff --git a/sensorset.C b/sensorset.C
> new file mode 100644
> index 0000000..8b59ac1
> --- /dev/null
> +++ b/sensorset.C
> @@ -0,0 +1,26 @@
> +#include <regex>
> +#include <iostream>
> +#include "sensorset.H"
> +#include "directory.H"
> +
> +// TODO: Issue#2 - STL regex generates really bloated code.  Use =
POSIX regex
> +//       interfaces instead.
> +static const std::regex sensors_regex =3D
> +    std::regex("^(fan|in|temp)([0-9]+)_([a-z]*)", =
std::regex::extended);
> +static const auto sensor_regex_match_count =3D 4;
> +
> +SensorSet::SensorSet(const std::string& path)
> +{
> +    Directory d(path);
> +    std::string file;
> +
> +    while(d.next(file))
> +    {
> +        std::smatch match;
> +        std::regex_search(file, match, sensors_regex);
> +
> +        if (match.size() !=3D sensor_regex_match_count) continue;
> +
> +        container[make_pair(match[1],match[2])].emplace(match[3]);
> +    }
> +}
> diff --git a/sensorset.H b/sensorset.H
> new file mode 100644
> index 0000000..beb8446
> --- /dev/null
> +++ b/sensorset.H
> @@ -0,0 +1,31 @@
> +#ifndef __SENSORSET_H
> +#define __SENSORSET_H
> +
> +#include <map>
> +#include <set>
> +#include <string>
> +
> +class SensorSet
> +{
> +    public:
> +        typedef std::map<std::pair<std::string, std::string>,
> +                         std::set<std::string>> container_t;
> +
> +        SensorSet(const std::string& path);
> +
> +        container_t::const_iterator begin()
> +        {
> +            return const_cast<const container_t&>(container).begin();
> +        }
> +
> +        container_t::const_iterator end()
> +        {
> +            return const_cast<const container_t&>(container).end();
> +        }
> +
> +    private:
> +        container_t container;
> +
> +};
> +
> +#endif
> diff --git a/sysfs.H b/sysfs.H
> new file mode 100644
> index 0000000..d073d77
> --- /dev/null
> +++ b/sysfs.H
> @@ -0,0 +1,31 @@
> +#ifndef __SYSFS_H
> +#define __SYSFS_H
> +
> +#include <fstream>
> +#include <string>
> +
> +template <typename T>
> +void read_sysfs(const std::string& path, T& val)
> +{
> +    std::ifstream s(path);
> +    s >> val;
> +}
> +
> +template <typename T>
> +void write_sysfs(const std::string& path, const T& val)
> +{
> +    std::ofstream s(path);
> +    s << val;
> +}
> +
> +const std::string make_sysfs_path(const std::string& path,
> +                                  const std::string& type,
> +                                  const std::string& id,
> +                                  const std::string& entry)
> +{
> +    using namespace std::literals;
> +
> +    return path + "/"s + type + id + "_"s + entry;
> +}
> +
> +#endif
> --=20
> 2.6.0
>=20
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
