Return-Path: <cyrilbur@gmail.com>
Received: from mail-pa0-x241.google.com (mail-pa0-x241.google.com
 [IPv6:2607:f8b0:400e:c03::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r8cCP3JbszDqF4
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2016 11:33:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=Gd4kuq9v; 
 dkim-atps=neutral
Received: by mail-pa0-x241.google.com with SMTP id rw9so3328277pab.2
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2016 18:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X7FiwEQRzNA1zrkk2cQiOqMb/POfwHUYeSYE6COQ5Ug=;
 b=Gd4kuq9vCff8ToGawL0rCr/KHgIAmMBkuASciqFAoieQkHiizkQMC7zQjelKa/CU6p
 wNp6r+syDnIEFmR8t2M2pupuT/ZFz1AUyQkjiyDu8jARWaQVslyO/wpJU+8eaZk00i8q
 23Qvzr5Rsk0Zb2CFKYCUiYniNByzQAEKq129sH3eqqaTIAZjwXztFMtR5t7bHdO+WOKz
 1BabdlFeXwn/WE1jSMvMJk+TXr0WXXmL2ZI2Uiv1GrZiuYrAWpe9Is958rvd1K92atZz
 O1ee7MbTvQ9qs4BkVG/QWzKNcqrkljXbZsmSgfRVF1NU6c5yGCvW9Q/h4cULlQeoK3io
 UFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X7FiwEQRzNA1zrkk2cQiOqMb/POfwHUYeSYE6COQ5Ug=;
 b=R7fLeOb1mQaUM1cWTOX+UJYbPJwdlPm8Pp65ievn+dDmrsLd4nTviW9xtveFDs8pXE
 r+V4SrF8446yCfacRk39UXQE3ycd55KMpJW7uCkSVPZQJFiUBL2k8rSxCA+k4r0DqZhj
 dKWpsHI5cjwGwfv2XLELENI46mcO1wBwuv05n0zJqE/QZC6Jj20ncIHnx/u9mrSDNjT8
 HvTMSkqevuPaijPRqkI3c1mjFp0SAsGi8FLp/IETiRe5R6Mf1njVv9aIIwka8pcPtN1f
 DsWlyqjhz58E4IDt4wNw2nmfVtkVvWkxJCqasCurEn0kOoPCZ/Fl+O62t6Y7UIQCco9j
 Fw6Q==
X-Gm-Message-State: AOPr4FV1My92DWmxk+H8e59Jydtt3liOo2F/Rwyvx5CRxiAThZopOePor63OgFZ44I6CfQ==
X-Received: by 10.66.148.2 with SMTP id to2mr6697972pab.72.1463535183730;
 Tue, 17 May 2016 18:33:03 -0700 (PDT)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id yl5sm7551734pac.38.2016.05.17.18.33.01
 (version=TLSv1/SSLv3 cipher=OTHER);
 Tue, 17 May 2016 18:33:03 -0700 (PDT)
Date: Wed, 18 May 2016 11:32:57 +1000
From: Cyril Bur <cyrilbur@gmail.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org, Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: [PATCH skeleton v2 2/3] Deprecate PropertyCacher.py
Message-ID: <20160518113257.1c7b2c50@camb691>
In-Reply-To: <1463533256-19471-3-git-send-email-openbmc-patches@stwcx.xyz>
References: <1463533256-19471-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1463533256-19471-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 18 May 2016 01:33:05 -0000

On Tue, 17 May 2016 20:00:55 -0500
OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:

> From: Brad Bishop <bradleyb@fuzziesquirrel.com>
> 
> The pyphosphor package provides equivalent function
> so use that and drop the duplicated code.
> 
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

Love deleting duplicated code!

Reviewed-by: Cyril Bur <cyrilbur@gmail.com>

> ---
>  bin/PropertyCacher.py  | 49 -------------------------------------------------
>  bin/inventory_items.py |  3 +--
>  bin/system_manager.py  |  2 +-
>  3 files changed, 2 insertions(+), 52 deletions(-)
>  delete mode 100644 bin/PropertyCacher.py
> 
> diff --git a/bin/PropertyCacher.py b/bin/PropertyCacher.py
> deleted file mode 100644
> index dfbb0b9..0000000
> --- a/bin/PropertyCacher.py
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -import os
> -import cPickle
> -import json
> -
> -CACHE_PATH = '/var/cache/obmc/'
> -
> -def getCacheFilename(obj_path, iface_name):
> -	name = obj_path.replace('/','.')
> -	filename = CACHE_PATH+name[1:]+"@"+iface_name+".props"
> -	return filename
> -
> -def save(obj_path, iface_name, properties):
> -	print "Caching: "+obj_path
> -	try:
> -		
> -		filename = getCacheFilename(obj_path, iface_name)
> -		output = open(filename, 'wb')
> -		try:
> -			## use json module to convert dbus datatypes
> -			props = json.dumps(properties[iface_name])
> -			prop_obj = json.loads(props)
> -			cPickle.dump(prop_obj,output)
> -		except Exception as e:
> -			print "ERROR: "+str(e)
> -		finally:
> -			output.close()
> -	except:
> -		print "ERROR opening cache file: "+filename
> -
> -
> -def load(obj_path, iface_name, properties):
> -	## overlay with pickled data
> -	filename=getCacheFilename(obj_path, iface_name)
> -	if (os.path.isfile(filename)):
> -		if (properties.has_key(iface_name) == False):
> -			properties[iface_name] = {}
> -		print "Loading from cache: "+filename
> -		try:			
> -			p = open(filename, 'rb')
> -			data = cPickle.load(p)
> -			for prop in data.keys():
> -				properties[iface_name][prop] = data[prop]
> -						
> -		except Exception as e:
> -			print "ERROR: Loading cache file: " +str(e)
> -		finally:
> -			p.close()
> -
> -
> diff --git a/bin/inventory_items.py b/bin/inventory_items.py
> index bf7f414..1b0fa39 100755
> --- a/bin/inventory_items.py
> +++ b/bin/inventory_items.py
> @@ -8,7 +8,7 @@ import dbus.service
>  import dbus.mainloop.glib
>  import cPickle
>  import json
> -import PropertyCacher
> +from obmc.dbuslib.propertycacher import PropertyCacher
>  from obmc.dbuslib.bindings import get_dbus, DbusProperties, DbusObjectManager
>  
>  if (len(sys.argv) < 2):
> @@ -37,7 +37,6 @@ class InventoryItem(DbusProperties):
>  		self.name = name
>  		
>  		## this will load properties from cache
> -		# PropertyCacher.load(name,INTF_NAME,self.properties)
>  		if (data.has_key('present') == False):
>  			data['present'] = 'False'
>  		if (data.has_key('fault') == False):
> diff --git a/bin/system_manager.py b/bin/system_manager.py
> index 2331131..fdb1bf1 100755
> --- a/bin/system_manager.py
> +++ b/bin/system_manager.py
> @@ -8,7 +8,7 @@ import dbus.service
>  import dbus.mainloop.glib
>  import os
>  import time
> -import PropertyCacher
> +from obmc.dbuslib.propertycacher import PropertyCacher
>  from obmc.dbuslib.bindings import DbusProperties, DbusObjectManager, get_dbus
>  import obmc.enums
>  
