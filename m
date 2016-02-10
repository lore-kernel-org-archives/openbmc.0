Return-Path: <dja@axtens.net>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 985041A039F
 for <openbmc@lists.ozlabs.org>; Wed, 10 Feb 2016 14:58:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b=CZ06Z3AT; 
 dkim-atps=neutral
Received: by mail-pf0-x241.google.com with SMTP id c10so369491pfc.0
 for <openbmc@lists.ozlabs.org>; Tue, 09 Feb 2016 19:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:subject:in-reply-to:references:user-agent:date:message-id
 :mime-version:content-type;
 bh=GUDQjwvJpQclnHte2xXar++S3P19N4VQqseQ7jKxs5U=;
 b=CZ06Z3ATUsfncNkGoaqSZU59td3IkFn/B0SEZn2UCmw5iXUFxDOI+7rysgccWDkUob
 nJv8n++ckdaAE8nmGLFg76j9a8HstXB/h1I9shvOLg3jina/OnUdFEAS9fcCIcnr4pW8
 oLEYqMoOuazthP1MB5h+NtyG20UMGjSsuLETw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:subject:in-reply-to:references
 :user-agent:date:message-id:mime-version:content-type;
 bh=GUDQjwvJpQclnHte2xXar++S3P19N4VQqseQ7jKxs5U=;
 b=ELfNd0vZ47BvmdkTDPD5HLaRcdBiXDCffGQFExmrYs9633f0AnD06lA0PtHw0mf3mN
 5pIHnS+Y0LCv1eCpMvNbPKRmfKw33UHFuCTITiOnzAKyJNPTnBNpFw0AGLHVvWRiLNI6
 eDNePwBg6pMkFe0x19bK32PHQEAM2cxTD9xrybzif8q6QRNOC5Qes9QkPRZF7OCcJEaJ
 1ylb54SGYJUpDP8YUiBhPRK963Ba5r8mGwjOP6DRJNAgduNa3SB4Gm6J1PbO6y+7fl8Y
 9Uq9P1MA+/5ODml6vhMyR50upWGjJ83O7e9EweevHlHT1rLc3MUMjvgaMRFvfbcapUZJ
 m1DA==
X-Gm-Message-State: AG10YORhbTqhu2JHxE6SVAChTycMm8FNmnT3sdXRkD3+H68n00sUm7n+y94W3fi0zOL4aw==
X-Received: by 10.98.66.81 with SMTP id p78mr55753723pfa.43.1455076694726;
 Tue, 09 Feb 2016 19:58:14 -0800 (PST)
Received: from localhost ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id f21sm1098332pfd.6.2016.02.09.19.58.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Feb 2016 19:58:14 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-networkd 1/2] org.openbmc.NetworkManager : Bug
 fixes, SetHwAddress & EnableDHCP
In-Reply-To: <1455022832-4842-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1455022832-4842-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1455022832-4842-2-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-pc-linux-gnu)
Date: Wed, 10 Feb 2016 14:58:09 +1100
Message-ID: <87ziv9jjxq.fsf@gamma.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
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
X-List-Received-Date: Wed, 10 Feb 2016 03:58:19 -0000

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:

Hi,

Thanks for your patch.

Could you please split it into different parts for the different things
you do?

I can see whitespace fixes and several different changes - it's really
difficult to review it if all these things are mixed together.

Thanks in advance!

Regards,
Daniel

> From: Hariharasubramanian R <hramasub@in.ibm.com>
>
> ---
>  netman.py | 82 +++++++++++++++++++++++++++++++++++++++++----------------------
>  1 file changed, 54 insertions(+), 28 deletions(-)
>
> diff --git a/netman.py b/netman.py
> index 3978cef..7f9d14e 100755
> --- a/netman.py
> +++ b/netman.py
> @@ -16,25 +16,27 @@ DBUS_NAME = 'org.openbmc.NetworkManager'
>  OBJ_NAME = '/org/openbmc/NetworkManager/Interface'
>  
>  network_providers = {
> -    'networkd' : { 
> -        'bus_name' : 'org.freedesktop.network1',
> -        'ip_object_name' : '/org/freedesktop/network1/network/default',
> -        'hw_object_name' : '/org/freedesktop/network1/link/_31',
> -        'interface_name' : 'org.freedesktop.network1.Network',
> -        'method' : 'org.freedesktop.network1.Network.SetAddr'
> -    },
> -    'NetworkManager' : {
> -        'bus_name' : 'org.freedesktop.NetworkManager',
> -        'ip_object_name' : '/org/freedesktop/NetworkManager',
> -        'hw_object_name' : '/org/freedesktop/NetworkManager',
> -        'interface_name' : 'org.freedesktop.NetworkManager',
> -        'method' : 'org.freedesktop.NetworkManager' # FIXME: 
> -    },  
> +	'networkd' : { 
> +		'bus_name' : 'org.freedesktop.network1',
> +		'ip_object_name' : '/org/freedesktop/network1/network/default',
> +		'hw_object_name' : '/org/freedesktop/network1/link/_31',
> +		'ip_if_name' : 'org.freedesktop.network1.Network',
> +		'hw_if_name' : 'org.freedesktop.network1.Link',
> +		'method' : 'org.freedesktop.network1.Network.SetAddr'
> +	},
> +	'NetworkManager' : {
> +		'bus_name' : 'org.freedesktop.NetworkManager',
> +		'ip_object_name' : '/org/freedesktop/NetworkManager',
> +		'hw_object_name' : '/org/freedesktop/NetworkManager',
> +		'ip_if_name' : 'org.freedesktop.NetworkManager',
> +		'hw_if_name' : 'org.freedesktop.NetworkManager',
> +		'method' : 'org.freedesktop.NetworkManager' # FIXME: 
> +	},	
>  }
>  
>  def getPrefixLen(mask):
> -    prefixLen = sum([bin(int(x)).count('1') for x in mask.split('.')])
> -    return prefixLen
> +	prefixLen = sum([bin(int(x)).count('1') for x in mask.split('.')])
> +	return prefixLen
>  
>  class IfAddr ():
>      def __init__ (self, family, scope, flags, prefixlen, addr, gw):
> @@ -58,7 +60,7 @@ class NetMan (dbus.service.Object):
>          netprov     = network_providers [self.provider]
>          bus_name    = netprov ['bus_name']
>          obj_path    = netprov ['ip_object_name']
> -        intf_name   = netprov ['interface_name']
> +        intf_name   = netprov ['ip_if_name']
>  
>          obj = self.bus.get_object(bus_name, obj_path)
>          intf = dbus.Interface(obj, intf_name)
> @@ -73,14 +75,14 @@ class NetMan (dbus.service.Object):
>          bus_name    = netprov ['bus_name']
>  
>          if (target == "ip"):
> -            intf_name   = 'org.freedesktop.network1.Network'
> +            intf_name   = netprov ['ip_if_name'] #'org.freedesktop.network1.Network'
>              obj_path    = netprov ['ip_object_name']
>              obj = self.bus.get_object(bus_name, obj_path)
>              intf = dbus.Interface(obj, intf_name)
>              return intf.GetAddress (device)
>  
>          if (target == "mac"):
> -            intf_name   = 'org.freedesktop.network1.Link'
> +            intf_name   = netprov ['hw_if_name'] #'org.freedesktop.network1.Link'
>              obj_path    = netprov ['hw_object_name']
>              obj = self.bus.get_object(bus_name, obj_path)
>              intf = dbus.Interface(obj, intf_name)
> @@ -88,16 +90,35 @@ class NetMan (dbus.service.Object):
>              print mac
>              return mac
>  
> -
> -
>      @dbus.service.method(DBUS_NAME, "", "")
>      def test(self):
>          print("TEST")
>  
> +    @dbus.service.method(DBUS_NAME, "s", "x")
> +    def EnableDHCP (self, device):
> +        confFile = "/etc/systemd/network/10-bmc-" + device + "-" + "dhcp.network"
> +        if os.path.exists(confFile):
> +            return 0
> +
> +        print("Making .network file...")
> +        networkconf = open (confFile, "w+") 
> +        networkconf.write ('[Match]'+ '\n')
> +        networkconf.write ('Name=' + (device) + '\n')
> +        networkconf.write ('[Network]' + '\n')
> +        networkconf.write ('DHCP=yes')
> +        networkconf.close ()
> +
> +        print("Restarting networkd service...")
> +        call(["systemctl", "restart", "systemd-networkd.service"])
> +        return 0
> +        #return self._setAddr ("add", device, ipaddr, netmask, 2, 0, 253, gateway)
> +
>      @dbus.service.method(DBUS_NAME, "ssss", "x")
>      def AddAddress4 (self, device, ipaddr, netmask, gateway):
>          prefixLen = getPrefixLen (netmask)
> -        confFile = "/etc/systemd/network/10-bmc-" + device + ".network"
> +        confFile = "/etc/systemd/network/10-bmc-" + device + "-" + ipaddr + '_' + str(prefixLen) + ".network"
> +        if os.path.exists(confFile):
> +            return 0
>  
>          print("Making .network file...")
>          networkconf = open (confFile, "w+") 
> @@ -116,7 +137,7 @@ class NetMan (dbus.service.Object):
>      @dbus.service.method(DBUS_NAME, "ssss", "x")
>      def DelAddress4 (self, device, ipaddr, netmask, gateway):
>          prefixLen = getPrefixLen (netmask)
> -        confFile = "/etc/systemd/network/10-bmc-" + device + ".network"
> +        confFile = "/etc/systemd/network/10-bmc-" + device + "-" + ipaddr + '_' + str(prefixLen) + ".network"
>          if not (os.path.exists(confFile)):
>              return 1
>  
> @@ -132,10 +153,16 @@ class NetMan (dbus.service.Object):
>      def GetHwAddress (self, device):
>          return self._getAddr ("mac", device)
>  
> -    @dbus.service.method(DBUS_NAME, "s", "i")
> -    def SetHwAddress (self, mac):
> -        rc = subprocess.call(["fw_setenv", "ethaddr", mac])
> -        return rc
> +    @dbus.service.method(DBUS_NAME, "ss", "s")
> +    def SetHwAddress (self, device, mac):
> +        netprov     = network_providers [self.provider]
> +        bus_name    = netprov ['bus_name']
> +        obj_path    = netprov ['hw_object_name']
> +        intf_name   = netprov ['hw_if_name']
> +
> +        obj = self.bus.get_object(bus_name, obj_path)
> +        intf = dbus.Interface(obj, intf_name)
> +        return intf.SetAddress (device, mac)
>  
>  def main():
>      dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
> @@ -149,4 +176,3 @@ def main():
>  
>  if __name__ == '__main__':
>      sys.exit(main())
> -
> -- 
> 2.6.4
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
