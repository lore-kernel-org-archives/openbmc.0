Return-Path: <geissonator@gmail.com>
Received: from mail-oi0-x22a.google.com (mail-oi0-x22a.google.com
 [IPv6:2607:f8b0:4003:c06::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t8kxw38d3zDvRL
 for <openbmc@lists.ozlabs.org>; Thu,  3 Nov 2016 23:37:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=ewD+90E2; 
 dkim-atps=neutral
Received: by mail-oi0-x22a.google.com with SMTP id 62so84095077oif.1
 for <openbmc@lists.ozlabs.org>; Thu, 03 Nov 2016 05:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=JWEIjeAXR3vFHYpEQO8jWt5WlCuFWSt9tclDlh4tQMQ=;
 b=ewD+90E2IoSwWBZgLRCH5iE96maUFc3Ywqubl2A2V0cH59f920cvwR4NuzUf1MO+ji
 sAJ4k2D+C8uHhxB97XQ/QcmkM5YSDiUZ2mTeIqsDt51rPReLWHQ9KFd789OpmzG7uBIC
 ojvewJ1AS5e4W4/9eGIEwA7JmRTYcTixPJKiLE7af1CjDaHScIAC4eylVipr0ZdSlRra
 DwK+4JXly9DR5J8UxbFurRa7qAbVbtMzhuA1TBb5m4z8d4L4ddwoY/JBzniYSLN1prvc
 XCTJv2kz1G1JtAIgZymM3v56J2NrZ/WV7b/EJyoSgOyAkmXK+yCnt+lZkcldezxcX9gT
 LywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=JWEIjeAXR3vFHYpEQO8jWt5WlCuFWSt9tclDlh4tQMQ=;
 b=TGxfYeZDzIKeWgz1jBgCEB8LpSy+Tsl6KDhtgNIv/ShfKOok/vNThMNWX8qKytbJnh
 3zEmBWpnL2pQIh+1mNGkfLOZsdgKbI8m6WYGVAITXEbFlWgSDkbUMbM1Q5tfDpIxiO8V
 suH4nHs7gO/N/SQC5pyLiH8/pRzWuCtDnAqhqvYrACKz/RVnxhAQ49MGxcJ2TDaf9BJh
 sgIz/OZcJdrmnUIas6ZLOUROdLtjLoW8nH2G09HhwZ1lUeRQEuqVD6CxJ51RDbGABvW5
 uyNbfR1TRq8SHNDjnOiYBbHYK4rZIaS1NeJU7AdaOQMlkbWvEe2ZFGeFtgUD4lRIIHU/
 Zf7A==
X-Gm-Message-State: ABUngveIsuVr6j77Yh3Ku9gZfPsqgHgBcPUITzLTl/uXiHi2aDO+uQl80zSM1EtUkof4pmK1Spy2xMPk8OGVcA==
X-Received: by 10.107.3.223 with SMTP id e92mr8208162ioi.113.1478176642344;
 Thu, 03 Nov 2016 05:37:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.164.83 with HTTP; Thu, 3 Nov 2016 05:37:21 -0700 (PDT)
In-Reply-To: <CACPK8Xf8=uCE3tSrUMtELgYsky6Br5b14BxL3DdH-XTk7ntzGg@mail.gmail.com>
References: <CACPK8Xcyic3BsnxTLx8c5p-=34xqrfDTZ4bFKa309hCSZPuhAw@mail.gmail.com>
 <CACPK8Xf8=uCE3tSrUMtELgYsky6Br5b14BxL3DdH-XTk7ntzGg@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Thu, 3 Nov 2016 07:37:21 -0500
Message-ID: <CALLMt=ospQEZ6iE9E7PP+jaQgFxyjkMBdCxczUfYm8p7n3P8yA@mail.gmail.com>
Subject: Re: op-flasher changes
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Thu, 03 Nov 2016 12:37:25 -0000

Hey Joel, best way to get test support is to make it easy :)

In the past, we've tried to stack the patches in a way that a single
CI build would have all the changes needed
(https://openpower.xyz/job/openbmc-build-gerrit-trigger-multi/) and we
could just grab the artifacts from that build to test the change.
Anything like this available yet?  I know this requires the
openbmc/openbmc recipe update usually which requires merged code in
the sub repo so not always possible.

Otherwise, providing a link we could wget the *.all.tar image from
works as well.

Andrew

On Thu, Nov 3, 2016 at 1:21 AM, Joel Stanley <joel@jms.id.au> wrote:
> On Thu, Nov 3, 2016 at 1:09 PM, Joel Stanley <joel@jms.id.au> wrote:
>> This requires some testing. I have a tree that updates the version of
>> skeleton we use to include the first set of patches here:
>>
>>   https://github.com/shenki/openbmc/tree/flasher-cleanups
>
> I tested this tree on a Palmetto by using rest to update the PNOR. It
> looks like it succeeded:
>
> Nov 03 06:11:10 palmetto download_manager.py[668]: Downloading:
> palmetto.pnor from 10.61.2.7
> Nov 03 06:11:10 palmetto phosphor-gevent[782]:
> ::c063:abb6:8e91:f402%1230014792 - - [2016-11-03 06:11:10] "POST
> /org/openbmc/control/flash/bios/action/updateViaTftp HTTP/1.1" 200 169
> 0.257042
> Nov 03 06:12:00 palmetto flash_bios.exe[710]: Starting flasher:
> bios,/tmp/palmetto.pnor,/org/openbmc/control/flash/bios,
> Nov 03 06:12:00 palmetto flash_bios.exe[710]: flasher:
> /tmp/palmetto.pnor, BMC = 1, address = 0x0
> Nov 03 06:12:00 palmetto flash_bios.exe[710]: Setting up flash
> Nov 03 06:13:24 palmetto phosphor-gevent[782]:
> ::c063:abb6:8e91:f402%1230014792 - - [2016-11-03 06:13:24] "GET
> /org/openbmc/control/flash/bios HTTP/1.1" 200 383 0.080871
> Nov 03 06:13:54 palmetto phosphor-gevent[782]:
> ::c063:abb6:8e91:f402%1230014792 - - [2016-11-03 06:13:54] "GET
> /org/openbmc/control/flash/bios HTTP/1.1" 200 383 0.082777
> Nov 03 06:15:04 palmetto flash_bios.exe[710]: Erasing... (may take a
> while !) done !
> Nov 03 06:15:04 palmetto flash_bios.exe[710]: About to program
> "/tmp/palmetto.pnor" at 0x00000000..0x02000000 !
> Nov 03 06:15:04 palmetto flash_bios.exe[710]: Programming & Verifying...
> Nov 03 06:15:04 palmetto flash_bios.exe[710]: Flash done
> Nov 03 06:19:25 palmetto systemd[1]: Starting Cleanup of Temporary
> Directories...
> Nov 03 06:19:25 palmetto systemd[1]: Started Cleanup of Temporary Directories.
>
> Cheers,
>
> Joel
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
