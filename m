Return-Path: <sam.mj@au1.ibm.com>
Received: from e23smtp03.au.ibm.com (e23smtp03.au.ibm.com [202.81.31.145])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r3qCg222BzDq60
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2016 16:31:43 +1000 (AEST)
Received: from localhost
 by e23smtp03.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <sam.mj@au1.ibm.com>;
 Tue, 10 May 2016 16:31:41 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp03.au.ibm.com (202.81.31.209) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 10 May 2016 16:31:39 +1000
X-IBM-Helo: d23dlp02.au.ibm.com
X-IBM-MailFrom: sam.mj@au1.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id 5A2652BB005E
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2016 16:31:23 +1000 (EST)
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
 by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u4A6UtiL56033492
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2016 16:31:18 +1000
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u4A6UH5u028454
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2016 16:30:17 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u4A6UHaB027015; Tue, 10 May 2016 16:30:17 +1000
Received: from localhost (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id E5999A01A5;
 Tue, 10 May 2016 16:20:14 +1000 (AEST)
Date: Tue, 10 May 2016 16:20:04 +1000
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org, Ken Lai <ken1029@gmail.com>
Subject: Re: [PATCH skeleton v9 23/23] Fix Makefile
Message-ID: <20160510062004.GA22261@localhost.localdomain>
References: <1462859449-5466-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1462859449-5466-24-git-send-email-openbmc-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1462859449-5466-24-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16051006-0009-0000-0000-000007236B12
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
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
X-List-Received-Date: Tue, 10 May 2016 06:31:43 -0000

Patches 22 and 23 should just be merged into the same patch (and have a
better description).
Did my other comments to v8 of this series come through properly?

Cheers,
Sam

On Tue, May 10, 2016 at 12:50:49AM -0500, OpenBMC Patches wrote:
> From: Ken Lai <ken1029@gmail.com>
> 
> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Makefile b/Makefile
> index eb9fac7..db05f88 100755
> --- a/Makefile
> +++ b/Makefile
> @@ -9,6 +9,7 @@ LIBS=$(shell pkg-config --libs gio-unix-2.0 glib-2.0) -Llib -lopenbmc_intf
>  INCLUDES += $(shell pkg-config --cflags --libs libsystemd) -I. -O2
>  LIB_FLAG += $(shell pkg-config  --libs libsystemd)
>  
> +DEPPKGS = libsystemd
>  INCLUDES_info += $(shell pkg-config --cflags $(DEPPKGS))
>  LIBS_info += $(shell pkg-config --libs $(DEPPKGS))
>  
> -- 
> 2.8.1
> 
> 
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
