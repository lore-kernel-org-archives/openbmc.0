Return-Path: <dja@axtens.net>
Received: from mail-pa0-x243.google.com (mail-pa0-x243.google.com
 [IPv6:2607:f8b0:400e:c03::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 7E7ED1A02CB
 for <openbmc@lists.ozlabs.org>; Tue,  9 Feb 2016 19:10:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b=fywecLYY; 
 dkim-atps=neutral
Received: by mail-pa0-x243.google.com with SMTP id yy13so6687145pab.1
 for <openbmc@lists.ozlabs.org>; Tue, 09 Feb 2016 00:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:subject:in-reply-to:references:user-agent:date:message-id
 :mime-version:content-type;
 bh=QI48zPO/vUVPBjHlRhILny9tcshQHklezUt3UqVoBfA=;
 b=fywecLYYmfVrB+x10MB7a52TlNA59ANQT8aP25KZagIlYf8euGjZHgvtn7yQ9q4UpV
 c7J56y7OxyeiUjzSVVut92n/Gj6eJez53ozaO6/q+kzYFpboNfbvA5dJe+BnEjRHxtyr
 lzKW74POVds9nnCGYe9Vd3e5kRNCwd2Zz6rLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:subject:in-reply-to:references
 :user-agent:date:message-id:mime-version:content-type;
 bh=QI48zPO/vUVPBjHlRhILny9tcshQHklezUt3UqVoBfA=;
 b=d5qalxM4t//30ZT6TN89YKHvteANBth2W+93KfnXMN74drX6n2hbWks7kKSoEIvpCd
 9FiVnhXabG8ReSo7MbANldQjVvWDI/6QGQRAabYNc4C0mbXv/DUcj8VFp119UMNm4hOO
 2LHEyYsX1vwd0obboNTX4hVSdGuAoygF4G4Jhc9IkVsapp9G1q66eqa88WEjw/3JH9Z5
 X2KzF/8sP/67oViBmEefXcTPKOnNQlbnQ9T0MkvJTbjhN6p/VsFDiYKLJjsmtKs3aLdG
 WETHVkPMpOr02WddLiNQwmUoGzLhE+bk1CAgwlPasvQtczEIRsY/NkEpTOYWuTvGfpoq
 GGAg==
X-Gm-Message-State: AG10YOQBcgFbI7UXQp6DUeULwi9FP4b+K+p/UPb1lVI/UtgGyfI/rMdNJiwjfL011PWEBg==
X-Received: by 10.67.22.166 with SMTP id ht6mr48946383pad.9.1455005421887;
 Tue, 09 Feb 2016 00:10:21 -0800 (PST)
Received: from localhost ([202.90.207.97])
 by smtp.gmail.com with ESMTPSA id r80sm48452922pfi.9.2016.02.09.00.10.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Feb 2016 00:10:21 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH openbmc] Prep work for presistent event logs
In-Reply-To: <1454994621-21413-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454994621-21413-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1454994621-21413-2-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-pc-linux-gnu)
Date: Tue, 09 Feb 2016 19:10:14 +1100
Message-ID: <874mdil2xl.fsf@gamma.ozlabs.ibm.com>
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
X-List-Received-Date: Tue, 09 Feb 2016 08:10:26 -0000

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:

> From: Chris Austen <austenc@us.ibm.com>
>
> Making a very simple commit that contains the additional required
> c++ flags along with making the directory to store the new event
> manager log files.  This does not enable anything, it is a
> precursor got the big drop.  I'd like to get some of the more
> simple things in to the build first since a 2 line change is
> faster to review.
> ---
>  .../common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb  | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb
> index 6cdf398..3b8ce0e 100644
> --- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb
> +++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb
> @@ -9,6 +9,7 @@ inherit obmc-phosphor-event-mgmt
>  inherit obmc-phosphor-sdbus-service
>  inherit obmc-phosphor-c-daemon
>  
> +TARGET_CPPFLAGS += "-std=c++11 -fpic"
>  
>  SRC_URI += "git://github.com/openbmc/phosphor-event"
>  
> @@ -22,6 +23,7 @@ S = "${WORKDIR}/git"
>  INSTALL_NAME = "event_messaged"
>  
>  do_install() {
> +        install -d ${D}/var/lib/obmc/events/

I think we briefly discussed this earlier, but I can't remember the
conclusion: is there any reason we can't make this /var/log/obmc/events
or something like that? There shouldn't be a problem with it being full
of little files: I don't think that breaks the /var/log semantic. (If it
did, /var/run might be the way to go?)

Regards,
Daniel

>          install -m 0755 -d ${D}${sbindir}
>          install -m 0755 ${S}/${INSTALL_NAME} ${D}/${sbindir}/obmc-phosphor-eventd
>  }
> -- 
> 2.6.4
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
