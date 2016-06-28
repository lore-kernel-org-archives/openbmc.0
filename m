Return-Path: <joel.stan@gmail.com>
Received: from mail-qt0-x22d.google.com (mail-qt0-x22d.google.com
 [IPv6:2607:f8b0:400d:c0d::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rdsNH0sydzDq5f
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jun 2016 13:53:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=LjPM4kZq; 
 dkim-atps=neutral
Received: by mail-qt0-x22d.google.com with SMTP id w59so2008099qtd.3
 for <openbmc@lists.ozlabs.org>; Mon, 27 Jun 2016 20:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=FZsxFM/XQP2iABtss4wnJZ0Um2VrIHrIBOh8ZEOfToQ=;
 b=LjPM4kZqKBnQKLZuPh5MgbAA6k8GBrUAVOsVkteqI4EKoqSRZn2zvTRVTv4fXr6FkO
 JPQvcOju45s4xtexlUUpH/+Mb9VGnoTR3VJ+UuzCE4nKcTW84z6a5DahMlATYbQOxm1c
 WAoK2KPNz+o+fjy/g6ovcWZYDwAJv7JdWeirRjj8V3IHgoO3hI1DsbzQbXB/LCQ7cuIA
 AN8r3j6SGPocBSdd/E23js3ABW7hLBuiOOGhrVSY6ccwPa9xdAKLgC/LHcSa9NllXmGO
 oLiUgbvlONHqLQQrn6wJE4xkeQ1YuXdVVixPte+fsBcoG9Vhq4PClwbmj7i3tN7opGYJ
 d7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=FZsxFM/XQP2iABtss4wnJZ0Um2VrIHrIBOh8ZEOfToQ=;
 b=Ae3doxsgEkYovUkdh9xiUORKv9taZelXOLsJ5QGSiSEr0+AgqpHgvuBpPlhOENStP8
 zgZHhta/sxQSdjE7vuanrv9OYE2UFVGx9uAYDS684BuRSCDeEPiFpWneggMzofO9RXmY
 oIEcc6jU0vdAEkYNR6rbsO0TyL23G+Puw1JfN8fQ0W2MOJmD9cwVlF/eA5xs2LGq3y8C
 JorZXfRUTGKTiftpe7PxaKXJly9ykdaRS08+SbDSPJmrmoAUrgMCAWU7z+rMTeqShjTN
 QZut5j7FSGbrKgQ1auQaKHopc77/PbgjTFJwfKI5rcQNvAJN364CDVBRFCl6ZgPVpVSQ
 sTsg==
X-Gm-Message-State: ALyK8tKDGBGKi82XnwqpVt9/z2ZSCaA7iPGV3kQBlUPcLdpweUPIFstsODB38PEeoE/7Ga6uA+On+lh1qWBBMw==
X-Received: by 10.200.39.237 with SMTP id x42mr1142682qtx.75.1467085996807;
 Mon, 27 Jun 2016 20:53:16 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Mon, 27 Jun 2016 20:52:57 -0700 (PDT)
In-Reply-To: <20160627221501.GN20922@asimov.austin.ibm.com>
References: <20160627221501.GN20922@asimov.austin.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 28 Jun 2016 13:22:57 +0930
X-Google-Sender-Auth: aWmO9il5BuiTMb5D8DFPu2QpIcE
Message-ID: <CACPK8Xd45WjdpyCPCibXwZj3tn1ud+HjP1s--aMdrNkD=38wmw@mail.gmail.com>
Subject: Re: Gerrit server migration
To: Patrick Williams <patrick@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Tue, 28 Jun 2016 03:53:19 -0000

Hi Patrick,

A few questions on how we should use gerrit.

On Tue, Jun 28, 2016 at 7:45 AM, Patrick Williams <patrick@stwcx.xyz> wrote:
> All,
>
> The Gerrit server is now ready for use.  All of the repositories except
> for the ones listed below are migrated to it.  We therefore no longer
> accept pull requests on Github, but instead need commits to go through
> Gerrit.

How do we get notifications when a patch is proposed for review?

Do we have owners of each component that must review before a patch
can be merged?

Cheers,

Joel

>
> For a reminder, the Gerrit server is at https://gerrit.openbmc-project.xyz
> and documentation can be found in this outstanding pull request
> https://github.com/openbmc/docs/pull/30 .
>
> The Gerrit server automatically replicates all merged commits back to
> Github, so Github is still considered the canonical location for our source.
>
> Not [yet] migrated repositories:
>     * Waiting on a few pull requests to be closed.
>         * openbmc / openbmc
>         * openbmc / skeleton
>         * openbmc / phosphor-host-ipmid
>         * openbmc / ipmi-fru-parser
>         * openbmc / openpower-host-ipmi-oem
>         * openbmc / phosphor-rest-server
>         * openbmc / openbmc-test-automation
>     * To be migrated later this week.
>         * openbmc / docs
>         * openbmc / openbmc-build-scripts
>     * Never to be migrated (use mailing list for commits).
>         * openbmc / linux
>         * openbmc / ipmitool
>         * openbmc / u-boot
>         * openbmc / qemu
> --
> Patrick Williams
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>
