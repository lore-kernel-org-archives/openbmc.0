Return-Path: <peter.maydell@linaro.org>
Received: from mail-wr0-x234.google.com (mail-wr0-x234.google.com
 [IPv6:2a00:1450:400c:c0c::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xY2w606LJzDrK9
 for <openbmc@lists.ozlabs.org>; Thu, 17 Aug 2017 20:47:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="fpM6fMnQ"; 
 dkim-atps=neutral
Received: by mail-wr0-x234.google.com with SMTP id x43so40405246wrb.3
 for <openbmc@lists.ozlabs.org>; Thu, 17 Aug 2017 03:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=B5SlY4HnWxa6VcmTq1fdirtO781fN0N5xrUIp3u9iiY=;
 b=fpM6fMnQseJqBDVSBe5LVXy1yL4KL7G+nZrZZRmENU8GlFjipTP7jVXGv3iko1GvVl
 CHLU9PGYop2MNpxeQs85AL0lU1kc4cQeRn5JCCIKMBd8/4akuuvqinu+QV1JInvXT4gn
 esqjaaY92cCK3eK2h7nheG917oNbs+YABq548=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=B5SlY4HnWxa6VcmTq1fdirtO781fN0N5xrUIp3u9iiY=;
 b=hf39xyLzgj9i90s0/TBJ3oTl7HITyISsxL58iCP0ESLgwd3ad3B6VzcL49lUaztQyU
 IoPy8r6mE6NIUVnbaRRBq0+UCVkIggiiiwyq5+On8JLkqJl9hgBxXVSWiQtFSIUXUf49
 qbbMb8G0kH7+vKo7ElciHM2/hhDb8hep0pLUNP+aUmYAuGDeJRNSjNTTHMk0AaeLDuLy
 4sU2LAw+MhF80VDSvXn9uV/cxcJND5T3rjg6VwZQwG66Z1wlElzBAk0r1/pRo51HGCbo
 WKhgbz8LD/M6pBw+9bP33APoPbOqgr4neqAiqbdUxHa5xXnqsPi5JQTGb3HsV1Lt3ypB
 zJqA==
X-Gm-Message-State: AHYfb5i8COTliPQFzl2W1CIYbAYSVMaXPBpSzra7A5+EhPEaa1nEDIE4
 Nd4S8cEU26QMxdMHSVCCreyACj17gDLZ
X-Received: by 10.28.193.10 with SMTP id r10mr614136wmf.157.1502966817911;
 Thu, 17 Aug 2017 03:46:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Thu, 17 Aug 2017 03:46:37 -0700 (PDT)
In-Reply-To: <20170809062828.3673-1-andrew@aj.id.au>
References: <20170809062828.3673-1-andrew@aj.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Aug 2017 11:46:37 +0100
Message-ID: <CAFEAcA-fQ+=ckEJJrOWDVLdEpEi_UxFZ0yySkhD7=k6dHrFCfA@mail.gmail.com>
Subject: Re: [PATCH for 2.11 v2 0/2] wdt_aspeed: Support reset width patterns
To: Andrew Jeffery <andrew@aj.id.au>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 ryan_chen@aspeedtech.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Aug 2017 10:47:02 -0000

On 9 August 2017 at 07:28, Andrew Jeffery <andrew@aj.id.au> wrote:
> Hello,
>
> These two patches add support for the reset width configuration register in the
> Aspeed watchdog. Initially this was just one patch[1], but I've reworked it as
> two to explicitly support the varying capabilities between Aspeed SoC versions.
>
> Andrew
>
> [1] http://patchwork.ozlabs.org/patch/796039/
>
> Andrew Jeffery (2):
>   watchdog: wdt_aspeed: Add support for the reset width register
>   aspeed_soc: Propagate silicon-rev to watchdog



Applied to target-arm.next ready for when 2.11 development opens, thanks.

-- PMM
