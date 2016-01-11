Return-Path: <cyrilbur@gmail.com>
Received: from mail-pa0-x241.google.com (mail-pa0-x241.google.com
 [IPv6:2607:f8b0:400e:c03::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id CC2BB1A08BB
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2016 14:03:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=UCk+0nDm; 
 dkim-atps=neutral
Received: by mail-pa0-x241.google.com with SMTP id yy13so24034056pab.1
 for <openbmc@lists.ozlabs.org>; Sun, 10 Jan 2016 19:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding;
 bh=kPNBjautRqpiO+rQ2STD7Y32pX8Ygf/3vH0gtFnGlNg=;
 b=UCk+0nDmCV60RXOFnOHhwE18FH0BTfFRyzGEMIq/Z6e4CWjPT9tC3plseh3erqBZ2Z
 U1TNdJ9QaLSzNqXWi8aFhGOpXZHm45QAqiin5kbKxokyxwXmqEXxnjJr8N4Y3htd6qgV
 FoZga8tKDuPeJwP8lcO0O4oLGAQexw9HbVVA9aVwlpCA9HAGXZLMxT2h9KkNqJjPFPn7
 1uSlKs7t1OV8/w0m0lElCVgYejCTXshtlBYWvLsO5MYwGK7GBed6aoLxX/DdNRzMsRY1
 +q9dLS/cT5KBgkSa9uJf2gciCc1PwykrGSeBaVTbG47tONJUeaP4t96GrE0CZjHg3NAv
 z8GA==
X-Received: by 10.66.55.6 with SMTP id n6mr177329044pap.33.1452481403291;
 Sun, 10 Jan 2016 19:03:23 -0800 (PST)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id f29sm19085042pfd.81.2016.01.10.19.03.21
 (version=TLSv1/SSLv3 cipher=OTHER);
 Sun, 10 Jan 2016 19:03:23 -0800 (PST)
Date: Mon, 11 Jan 2016 14:03:15 +1100
From: Cyril Bur <cyrilbur@gmail.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-settingsd] Create the settings dbus object.
Message-ID: <20160111140315.421a2e29@camb691>
In-Reply-To: <1452462032-12848-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1452462032-12848-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1452462032-12848-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Claws Mail 3.13.1 (GTK+ 2.24.29; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
X-List-Received-Date: Mon, 11 Jan 2016 03:03:26 -0000

On Sun, 10 Jan 2016 15:40:32 -0600
OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:

> From: Adriana Kobylak <anoo@us.ibm.com>

Hi Adriana,

Firstly, I just want to say that we should think about getting this written in
C sooner than later. I have no problems with prototyping in python, in fact I'm
all for it (what's what it's for!), but I just want to stay on top of the
potential mountain of python we'll have to convert.

I also have a few questions,

> 
> Host settings are specified in a yaml file.

By who or what?

The reason I ask is that if we can represent the settings as a python
dictionary (which looks quite parsable by humans) or even JSON (I'm told a
JSON parser is in standard python) from the start we don't need all this this.

> Parser converts the yaml file into a dictionary.

And presumably runs somewhere where dependencies of python is not an issue.

> The settings manager runs on the BMC and uses the dictionary to
> create the dbus properties and save the values in the BMC so that
> the values persist.
> ---
>  settings.yaml       | 14 ++++++++
>  settings_file.py    |  2 ++
>  settings_manager.py | 94 +++++++++++++++++++++++++++++++++++++++++++++++++++++
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
> +SETTINGS={'host': {'bootflags': {'default': '0000000000', 'type': 's', 'name': 'boot_flags'}, 'powercap': {'name': 'power_cap', 'min': 0, 'default': 0, 'max': 1000, 'type': 'i', 'unit': 'watts'}}}
> \ No newline at end of file

If I understand correctly this file was generated. It is unwise to commit
generated code into version control, the two files are bound to get out of sync,
it can be generated as needed.

> diff --git a/settings_manager.py b/settings_manager.py
> new file mode 100755
> index 0000000..53ce7fb
> --- /dev/null
> +++ b/settings_manager.py
> @@ -0,0 +1,94 @@
> +#!/usr/bin/python -u
> +

I'm no good at python so I'm sure I've missed something, hopefully someone can
help out here.

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
> +# Path where the settings are stored in the BMC
> +SETTINGS_PATH = '/tmp/'

How temporary is this code? I would say that unless you're actively writing a
follow up patch... surely python has a mktemp(1) equivalent that you can use?

> +
> +class HostSettingsObject(Openbmc.DbusProperties):
> +    def __init__(self,bus,name):
> +        Openbmc.DbusProperties.__init__(self)
> +        dbus.service.Object.__init__(self,bus,name)
> +
> +        # Listen to changes in the property values and sync them to the BMC
> +        bus.add_signal_receiver(self.settings_signal_handler,
> +            dbus_interface = "org.freedesktop.DBus.Properties",
> +            signal_name = "PropertiesChanged",
> +            path = "/org/openbmc/settings/host0")
> +
> +        # Create the dbus properties
> +        for i in s.SETTINGS['host'].iterkeys():
> +            self.sname = s.SETTINGS['host'][i]['name']
> +            self.stype = s.SETTINGS['host'][i]['type']
> +            self.svalue = s.SETTINGS['host'][i]['default']
> +            self.bmcvalue = self.svalue # Default BMC value to file value
> +            self.set_settings_property()
> +
> +    # Check if the requested value is the same as the current one in the BMC
> +    def check_settings_need_update(self):
> +        filepath = SETTINGS_PATH + self.sname
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
> +        update = self.check_settings_need_update()
> +        if update == True:
> +            self.svalue = self.bmcvalue # Update svalue with the value that will be used 
> +            if self.stype=="i":
> +                self.Set(DBUS_NAME,self.sname,self.svalue)
> +            elif self.stype=="s":
> +                self.Set(DBUS_NAME,self.sname,str(self.svalue))
> +
> +    # Save the settings to the BMC. This will write the settings value in
> +    # individual files named by the property name to the BMC.
> +    def set_system_settings(self):
> +        update = self.check_settings_need_update()
> +        if update == True:
> +            filepath = SETTINGS_PATH + self.sname
> +            with open(filepath, 'w') as f:
> +                f.write(str(self.svalue))
> +
> +    # Signal handler for when one ore more settings properties were updated.
> +    # This will sync the changes to the BMC.
> +    def settings_signal_handler(self, interface_name, changed_properties, invalidated_properties):
> +        data = changed_properties                                           
> +        for i in data:                                                      
> +            self.sname = i
> +            self.svalue = data[i]
> +            self.set_system_settings()
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
