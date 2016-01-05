Return-Path: <cyrilbur@gmail.com>
Received: from mail-pa0-x22b.google.com (mail-pa0-x22b.google.com
 [IPv6:2607:f8b0:400e:c03::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 094E01A113B
 for <openbmc@lists.ozlabs.org>; Tue,  5 Jan 2016 11:38:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=pKnDB0nt; 
 dkim-atps=neutral
Received: by mail-pa0-x22b.google.com with SMTP id uo6so185565272pac.1
 for <openbmc@lists.ozlabs.org>; Mon, 04 Jan 2016 16:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding;
 bh=1x7xJAEwQn9UVGtK/4wHzBWFdq1QoyDRuzYiBrbCU0I=;
 b=pKnDB0ntBT7A5GWcPeQ1Tu47NNMM1LVgbXZj4MZpAt5QV6D8yYFIMS0yf1Du9OkYSH
 aDHJMtfIOL/8PL00x6BB0J1urFXHtmIwaaTf2N+AonZpSgGuxvT1jLc6aag4a/mRMCPZ
 EYJQ3U+yN2MdyFzFDMJB0mgVF283yJADb3E8koKZsbHHWjzSVC81YkqIWGq45UTqrpg9
 BFpfctoDC++ts/MRjgfwmxJLlIZNnynjJ8g+DXJ/26F9+smQHnMRMIVn2/yXc/O8DrdX
 TxWTmYoxXP6acWdo2jxLN25fEAVb9rDGND6S2UETaUxB5YTzz1A9h90fCU4wBNCXiQCq
 3Hqg==
X-Received: by 10.66.253.5 with SMTP id zw5mr71489252pac.100.1451954288666;
 Mon, 04 Jan 2016 16:38:08 -0800 (PST)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id 6sm65899780pfm.46.2016.01.04.16.38.07
 (version=TLSv1/SSLv3 cipher=OTHER);
 Mon, 04 Jan 2016 16:38:08 -0800 (PST)
Date: Tue, 5 Jan 2016 11:38:00 +1100
From: Cyril Bur <cyrilbur@gmail.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH skeleton] Re-enable host watchdog
Message-ID: <20160105113800.259ed226@camb691>
In-Reply-To: <1451380835-18728-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1451380835-18728-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1451380835-18728-2-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 05 Jan 2016 00:38:11 -0000

On Tue, 29 Dec 2015 03:20:35 -0600
OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:

> From: Yi Li <adamliyi@msn.com>
> 
> This fix is for workitem: 143559. The code is commented out due to a bug.
> That bug has been fixed already. I tested on Palmetto and Barreleye, by
> repeatly calling "obmcutil poweron / obmcutil poweroff" with a script.
> Journalctrl shows no "Watchdog Err" message. So re-enable the host wdt.

Where does one look up workitems? I don't know what a workitem is.

> ---
>  bin/chassis_control.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/bin/chassis_control.py b/bin/chassis_control.py
> index 27e9152..9cee295 100755
> --- a/bin/chassis_control.py
> +++ b/bin/chassis_control.py
> @@ -188,8 +188,8 @@ class ChassisControlObject(Openbmc.DbusProperties,Openbmc.DbusObjectManager):
>  		
>  	def host_watchdog_signal_handler(self):
>  		print "Watchdog Error, Hard Rebooting"
> -		#self.Set(DBUS_NAME,"reboot",1)
> -		#self.powerOff()
> +		self.Set(DBUS_NAME,"reboot",1)
> +		self.powerOff()
>  		

Interesting that the code was commented... oh well the problem has gone away.

>  
>  if __name__ == '__main__':
