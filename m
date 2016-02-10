Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 71BB21A006D
 for <openbmc@lists.ozlabs.org>; Wed, 10 Feb 2016 12:50:25 +1100 (AEDT)
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Tue, 9 Feb 2016 18:50:23 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 9 Feb 2016 18:50:20 -0700
X-IBM-Helo: d03dlp01.boulder.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id 995DD1FF0046
 for <openbmc@lists.ozlabs.org>; Tue,  9 Feb 2016 18:38:29 -0700 (MST)
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u1A1oJWP25297054
 for <openbmc@lists.ozlabs.org>; Tue, 9 Feb 2016 18:50:19 -0700
Received: from d03av02.boulder.ibm.com (localhost [127.0.0.1])
 by d03av02.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u1A1oJAW016434
 for <openbmc@lists.ozlabs.org>; Tue, 9 Feb 2016 18:50:19 -0700
Received: from birb.localdomain (birb.au.ibm.com [9.185.120.172] (may be
 forged))
 by d03av02.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u1A1o9uT015841; Tue, 9 Feb 2016 18:50:19 -0700
Received: by birb.localdomain (Postfix, from userid 1000)
 id 390F12286E20; Wed, 10 Feb 2016 12:50:06 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH skeleton v2 1/2] Implement new LED driver
In-Reply-To: <1455058845-30270-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1455058845-30270-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1455058845-30270-2-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Wed, 10 Feb 2016 12:50:06 +1100
Message-ID: <87a8n9tju9.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16021001-0017-0000-0000-000011F89D4A
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
X-List-Received-Date: Wed, 10 Feb 2016 01:50:26 -0000

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:
> From: Adriana Kobylak <anoo@us.ibm.com>
>
> Verification for the new LED driver is completed so time to replace the
> previous gpio implementation with the new one. This entails
> replacing the led_controller file with the led_controller_new file,
> updating the dbus interface name so that it is the same as the previous
> one, and updating the code with the new led names.
> ---
>  Makefile                     |   7 +-
>  bin/Barreleye.py             |  12 +-
>  bin/Palmetto.py              |   6 +-
>  bin/chassis_control.py       |   2 +-
>  bin/obmcutil                 |   2 +-
>  objects/led_controller.c     | 617 ++++++++++++++++++++++++++++++++-----------
>  objects/led_controller_new.c | 488 ----------------------------------
>  7 files changed, 470 insertions(+), 664 deletions(-)
>  delete mode 100755 objects/led_controller_new.c
>
> diff --git a/Makefile b/Makefile
> index 65787ff..49600ba 100755
> --- a/Makefile
> +++ b/Makefile
> @@ -36,11 +36,8 @@ libopenbmc_intf: openbmc_intf.o
>  power_control: power_control_obj.o gpio.o object_mapper.o libopenbmc_intf
>  	$(CC) -o bin/$@.exe obj/gpio.o obj/power_control_obj.o obj/object_mapper.o $(LDFLAGS) $(LIBS)
>  
> -led_controller: led_controller.o gpio.o object_mapper.o libopenbmc_intf
> -	$(CC) -o bin/$@.exe obj/gpio.o obj/led_controller.o obj/object_mapper.o $(LDFLAGS) $(LIBS)
> -
> -led_controller_new: led_controller_new.o
> -	$(CC) -o bin/$@.exe obj/led_controller_new.o $(LDFLAGS) $(LIBS) -lsystemd
> +led_controller: led_controller.o
> +	$(CC) -o bin/$@.exe obj/led_controller.o $(LDFLAGS) $(LIBS)
> -lsystemd

.exe ? Really?

-- 
Stewart Smith
OPAL Architect, IBM.
