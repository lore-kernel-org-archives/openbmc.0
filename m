Return-Path: <andrewrjeffery@gmail.com>
Received: from mail-pa0-x243.google.com (mail-pa0-x243.google.com
 [IPv6:2607:f8b0:400e:c03::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 868201A0050
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 10:10:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=NhXNzyeP; 
 dkim-atps=neutral
Received: by mail-pa0-x243.google.com with SMTP id yy13so25077758pab.1
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2016 15:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:message-id:subject:reply-to:to:date:in-reply-to:references
 :organization:content-type:mime-version:content-transfer-encoding;
 bh=bn82+bbNS5QSgWS5lpSIwUn/dcy93GNK10o+fUvaCNM=;
 b=NhXNzyePez8xYXMDogh1EDAXO60BfDkN56Sv64VD5Ji28t1Q7pDop6QT0umvSikH+8
 6H7Va1a43FMZcbH9YCMPXV3SNZlsrmjFmX6Qb9nERqGPnrMfeJHJ5vY7g4kZ90JqOtOX
 6g2a2qj0B2NMKzsf3ZZhXpcs6lTo4OZPLyLGmaDclRLY9ArVL5IyR+/HEYaEvLylK0KR
 DrPVK9v00IOsD0t2S3KhYfjq/YhSZ69Cj5E3uRkI6tlDVHOjwq3Tnh2XVUoCDmP186dB
 ffFddrhwsvkVgzhQawkVr397tAtzAnqcseLxTgp8xSsLponDlIG57xsRbLxLy0pEk3yr
 iO1A==
X-Received: by 10.66.156.106 with SMTP id wd10mr184839088pab.150.1452553813801; 
 Mon, 11 Jan 2016 15:10:13 -0800 (PST)
Received: from keelia (ppp203-122-213-247.static.internode.on.net.
 [203.122.213.247])
 by smtp.gmail.com with ESMTPSA id 16sm25565240pfh.48.2016.01.11.15.10.11
 (version=TLSv1/SSLv3 cipher=OTHER);
 Mon, 11 Jan 2016 15:10:13 -0800 (PST)
From: Andrew Jeffery <andrewrjeffery@gmail.com>
X-Google-Original-From: Andrew Jeffery <andrew@aj.id.au>
Message-ID: <1452553808.25056.29.camel@aj.id.au>
Subject: Re: [PATCH phosphor-settingsd] Create the settings dbus object.
Reply-To: andrew@aj.id.au
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Tue, 12 Jan 2016 09:40:08 +1030
In-Reply-To: <1452462032-12848-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1452462032-12848-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1452462032-12848-2-git-send-email-openbmc-patches@stwcx.xyz>
Organization: IBM OzLabs
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Mon, 11 Jan 2016 23:10:18 -0000

Hi Adriana,

Given Cyril's comments on switching to C I'm not sure what the lifetime
of the Python code is, but regardless I've had a crack at reviewing it.
I'm new to the OpenBMC codebase so maybe take the comments with a grain
of salt, but I've concentrated on reviewing a couple of concepts,
mainly in settings_manager.py:

* Reducing reliance on global variables
* Using explicit rather than implicit state (formal method parameters
vs class member variables) and eliminating class members
* Code reduction

Particularly, I found the code harder to follow than I expected due to
the use of class members to hold transient state (as far as I can
see?). Ideally class members should only be used when state needs to be
held across calls to a given method rather than to transfer information
through a stack of method calls.

Making the mods to the script gives a reduction of around 20 lines /
~20%, and hopefully improves the readability. Note that I haven't
tested any of the changes, just made suggestions based on reading the
code.

On Sun, 2016-01-10 at 15:40 -0600, OpenBMC Patches wrote:
> From: Adriana Kobylak <anoo@us.ibm.com>
> 
> Host settings are specified in a yaml file.
> Parser converts the yaml file into a dictionary.
> The settings manager runs on the BMC and uses the dictionary to
> create the dbus properties and save the values in the BMC so that
> the values persist.
> ---
>  settings.yaml       | 14 ++++++++
>  settings_file.py    |  2 ++
>  settings_manager.py | 94
> +++++++++++++++++++++++++++++++++++++++++++++++++++++
>  settings_parser.py  | 20 ++++++++++++
>  4 files changed, 130 insertions(+)
>  create mode 100644 settings.yaml
>  create mode 100644 settings_file.py
>  create mode 100755 settings_manager.py
>  create mode 100755 settings_parser.py
> 
> diff --git a/settings.yaml b/settings.yaml
> new file mode 100644
> index 0000000..8bd9543
> --- /dev/null
> +++ b/settings.yaml
> @@ -0,0 +1,14 @@
> +---
> +# Settings Config File
> +host:
> +    powercap:
> +        name: power_cap
> +        type: i
> +        default: 0
> +        min: 0
> +        max: 1000
> +        unit: watts
> +    bootflags:
> +        name: boot_flags
> +        type: s
> +        default: "0000000000"
> diff --git a/settings_file.py b/settings_file.py
> new file mode 100644
> index 0000000..85f04f0
> --- /dev/null
> +++ b/settings_file.py
> @@ -0,0 +1,2 @@
> +#!/usr/bin/python -u
> +SETTINGS={'host': {'bootflags': {'default': '0000000000', 'type':
> 's', 'name': 'boot_flags'}, 'powercap': {'name': 'power_cap', 'min':
> 0, 'default': 0, 'max': 1000, 'type': 'i', 'unit': 'watts'}}}
> \ No newline at end of file
> diff --git a/settings_manager.py b/settings_manager.py
> new file mode 100755
> index 0000000..53ce7fb
> --- /dev/null
> +++ b/settings_manager.py
> @@ -0,0 +1,94 @@
> +#!/usr/bin/python -u
> +
> +import gobject
> +import dbus
> +import dbus.service
> +import dbus.mainloop.glib
> +import Openbmc
> +import settings_file as s
> +
> +DBUS_NAME = 'org.openbmc.settings.Host'
> +OBJ_NAME = '/org/openbmc/settings/host0'
> +CONTROL_INTF = 'org.openbmc.Settings'
> +
> +# TODO Save settings in tmp until persistant storage is available

typo: persistent

> +# Path where the settings are stored in the BMC
> +SETTINGS_PATH = '/tmp/'
> +
> +class HostSettingsObject(Openbmc.DbusProperties):
> +    def __init__(self,bus,name):

First off - formatting - I don't know what the expectations are in the
codebase, but the style used in PEP-8[3] uses spaces between the
function/method parameters. It looks easier to read IMO, and I suggest
this be fixed throughout the script.

Secondly, I think we should pass in the settings object and the
settings path as parameters to the constructor. This at least allows
flexibility if required (e.g. testing). We could assign the settings
path parameter a default value of "/tmp/" as well, which eliminates the
SETTINGS_PATH global. So something like:

       def __init__(self, bus, name, settings, path="/tmp/"):

> +        Openbmc.DbusProperties.__init__(self)
> +        dbus.service.Object.__init__(self,bus,name)

Then store the path value as we'll use that later:

           self.path = path

> +
> +        # Listen to changes in the property values and sync them to
> the BMC
> +        bus.add_signal_receiver(self.settings_signal_handler,
> +            dbus_interface = "org.freedesktop.DBus.Properties",
> +            signal_name = "PropertiesChanged",
> +            path = "/org/openbmc/settings/host0")
> +
> +        # Create the dbus properties
> +        for i in s.SETTINGS['host'].iterkeys():

This seems to be the only place we use s.SETTINGS, so by passing it in
as a constructor parameter we gain flexibility and lose nothing (i.e.
no need to store it as a member, we just iterate over it the same way
here).

> +            self.sname = s.SETTINGS['host'][i]['name']
> +            self.stype = s.SETTINGS['host'][i]['type']
> +            self.svalue = s.SETTINGS['host'][i]['default']
> +            self.bmcvalue = self.svalue # Default BMC value to file value
> +            self.set_settings_property()

So if I understand correctly, we mutate the object's members in batches
in order to update DBUS via methods that take no parameters. Perhaps
you could instead pass the values as parameters to the method? This
would remove the need for the class members. As stated in the Zen of
Python[1], "Explicit is better than implicit", so I think this is
something we should aim for.

Combined with the suggestion above regarding the __init__ parameters,
the loop would look like:

            for k in settings.iterkeys():
                shk = settings['host'][k] # just short-hand
                self.set_settings_property(shk['host'], shk['value'], shk['type'])

> +
> +    # Check if the requested value is the same as the current one in the BMC
> +    def check_settings_need_update(self):

If you move away from the class members you need to change this
signature to take in the required information:

       def check_settings_need_update(self, name, value):

Also something to consider might be changing this method to just return
the value read from the file or None (e.g. if an exception occurs)
rather than evaluating whether the update is required. This simplifies
it's implementation to code like the following:

    def get_bmc_value(self, name):
        try:
            with open(path.join(self.path, name), 'r') as f:
                return f.read()
        except (IOError):
            pass
        return None

It has one less parameter (no 'value') and pushes the equality test out
to the caller, which removes the need for the 'update' variable. Maybe
not a huge win, but seems more readable IMO. The impact of pushing the
equality test out to the caller doesn't have a big impact if the
suggestion to always write changes is taken below, as there will only
be one caller.

I briefly experimented with propagating the IOError (returning None in
that case didn't feel very tasteful), but this made the change more
complex than I'd hoped.

> +        filepath = SETTINGS_PATH + self.sname

FWIW, the Python module os.path contains all sorts of goodies for
manipulating paths, including a 'join' method[2]. Whilst this is a
relatively simple case to check as it stands, if the SETTINGS_PATH
variable changes its value (which is likely given the comment about
being a temporary location?) things could break. os.path.join() would
allow the code to work with or without the trailing '/' (and is more
portable, not that this probably matters). So:

           import os.path as path
           ...
           filepath = path.join(self.path, name)

> +        update = True
> +        try:
> +            with open(filepath, 'r') as f:
> +                self.bmcvalue = f.read() # Upate BMC value with value on system
> +                if self.bmcvalue == self.svalue:
> +                    update = False
> +        except (IOError):
> +            pass
> +        return update
> +
> +    # Create dbus properties based on bmc value. This will be either a value
> +    # previously set, or the default file value if the BMC value does not exist.
> +    def set_settings_property(self):

Given the previous suggestions, this signature would become:

       def set_settings_property(self, name, value, value_type):

and update the body accordingly

> +        update = self.check_settings_need_update()
> +        if update == True:

if you use the get_bmc_value() method above this code becomes:

           bmcv = self.get_bmc_value(name)
           if bmcv != value:

Which isn't a great deal of difference, but gives the small win in the
get_bmc_value() implementation

> +            self.svalue = self.bmcvalue # Update svalue with the value that will be used 
> +            if self.stype=="i":
> +                self.Set(DBUS_NAME,self.sname,self.svalue)

Do we need to do a type conversion here too (int()? str()?)? Also, in
this area of the code the whitespace formatting should be fixed (i.e.
spaces between operators and function parameters).

> +            elif self.stype=="s":
> +                self.Set(DBUS_NAME,self.sname,str(self.svalue))
> +
> +    # Save the settings to the BMC. This will write the settings value in
> +    # individual files named by the property name to the BMC.
> +    def set_system_settings(self):

Again, with explicit over implicit, this would become:

       def set_system_settings(self, name, value):

and the body should be updated accordingly.

> +        update = self.check_settings_need_update()

Given that we'll hit the filesystem twice - once to check whether we
need to update the file and another to update it - are we better off
just unconditionally writing the new value even if it's the same? Would
this cause any unwanted side-effects?

> +        if update == True:
> +            filepath = SETTINGS_PATH + self.sname

See above comment about os.path.join()

> +            with open(filepath, 'w') as f:
> +                f.write(str(self.svalue))
> +
> +    # Signal handler for when one ore more settings properties were updated.
> +    # This will sync the changes to the BMC.
> +    def settings_signal_handler(self, interface_name, changed_properties, invalidated_properties):

I couldn't see a reason for this assignment?

> +        data = changed_properties                                           
> +        for i in data:                                                      
> +            self.sname = i
> +            self.svalue = data[i]
> +            self.set_system_settings()

Avoiding the class members, this loop could become:

           for name, value in changed_properties.items():
               self.set_system_settings(name, value)

> +
> +    # Placeholder signal. Needed to register the settings interface.
> +    @dbus.service.signal(DBUS_NAME,signature='s')
> +    def SettingsUpdated(self,sname):
> +        pass
> +
> +if __name__ == '__main__':
> +    dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
> +
> +    bus = Openbmc.getDBus()
> +    name = dbus.service.BusName(DBUS_NAME, bus)
> +    obj = HostSettingsObject(bus, OBJ_NAME)

If you change the constructor as suggested this would become

       obj = HostSettingsObject(bus, OBJ_NAME, s.SETTINGS)

> +    mainloop = gobject.MainLoop()
> +
> +    print "Running HostSettingsService"
> +    mainloop.run()
> +
> diff --git a/settings_parser.py b/settings_parser.py
> new file mode 100755
> index 0000000..46bb474
> --- /dev/null
> +++ b/settings_parser.py
> @@ -0,0 +1,20 @@
> +#!/usr/bin/python -u
> +
> +# Simple parser to create a python dictionary from a yaml file.
> +# It saves the applications from doing the parsing and
> +# adding dependencies to additional modules like yaml
> +
> +import yaml
> +
> +SETTINGS_FILE = 'settings.yaml'
> +OUTPUT_FILE = 'settings_file.py'
> +FILE_HEADER = '#!/usr/bin/python -u'
> +
> +with open(SETTINGS_FILE) as s:
> +    data = yaml.safe_load(s)
> +
> +with open(OUTPUT_FILE, 'w') as f:
> +    f.write(FILE_HEADER)
> +    f.write('\n')
> +    f.write('SETTINGS=')
> +    f.write(str(data))

Andrew

[1] https://www.python.org/dev/peps/pep-0020/
[2] https://docs.python.org/2/library/os.path.html
[3] https://www.python.org/dev/peps/pep-0008/#other-recommendations
