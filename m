Return-Path: <sjg@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400d:c09::241; helo=mail-qk0-x241.google.com;
 envelope-from=sjg@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="mwcOwu3e"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="cLAxSpW2";
 dkim-atps=neutral
Received: from mail-qk0-x241.google.com (mail-qk0-x241.google.com
 [IPv6:2607:f8b0:400d:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zWBSj2GnjzDqH7
 for <openbmc@lists.ozlabs.org>; Wed, 31 Jan 2018 03:20:52 +1100 (AEDT)
Received: by mail-qk0-x241.google.com with SMTP id a5so10812860qkg.10
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jan 2018 08:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=0XuHKoOs4qJB3mz2Yt3iZr4+E+GPkdtrgtg6JEKvdHU=;
 b=mwcOwu3e+5vDN0qyYhxVJ1wmNUF9zUQg2lmP2LxKmTIazZUqp1SdhUB1HZCdt4z9Cn
 4LsJ1E9yQlTBUTvlRjwx1Bu3/msj42GQ9mapi+ak3xdEclmQ5MMD5nW/tv/WkGOu3van
 To+7TRk1y3ESeZyMuQ+dpkcQS6IWR/KoJTxt9kcnJf1gkwwvObEWTzoIvH96OqO6rDh3
 gncnYVfpNOjLcieUzLMQ39ezCUh+v3DAUTq+0ABnwuCBjGMkPetUToqiAXTNjUIw5cqR
 ozunnpWLOG0AqOTWf9rjC/rp11pJrv8bfkRRWsi51hXrYZlsagDujTnmN35DJpZ1B1Lb
 im7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=0XuHKoOs4qJB3mz2Yt3iZr4+E+GPkdtrgtg6JEKvdHU=;
 b=cLAxSpW2Z9351MLKdwaQ+ZCHGmM6q32ONEsaGna9jfTJzbKGTiJRg1vIRp7QUlU8p7
 IlXGsiUFIB91rzVOvLg1tKAookLdrznjawSPAtJrslTs8rBw0QefgqyiNkgdtHneeG9c
 7leAekkFFVujr5sMWpNX61hm1T3BJCAWlZHO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=0XuHKoOs4qJB3mz2Yt3iZr4+E+GPkdtrgtg6JEKvdHU=;
 b=d1791Brv/pPmVgoq0+Pxk5LlkiTO6LfYcqwpq+Ykrv1G8eiXIEsDYLYSszXXYegAtj
 2hO2lLit0HuMq5bDXCuAZSmQnr6+GSkz84CR1F6WzIh24n3wRTtBd5Wwl8RxU+FY34G1
 2wTcmcCXrLG5YNXCMOv+f19Kq4qtjj6oh646jnpce1NFq1/2w16ajVYb+8l6YbG12tJH
 owSgogXOK8pimkXtR7WF08I8nECwcqkUWWZZY8PesB4B5lpIaSj+bxMuyZHbu0RekEeQ
 3T79kk+bwFsuEhc7nkkHj0ibSTMsnhQScsH15kI3BQo8016cd6wTo9A8f9+xmSXoHcqJ
 ypRA==
X-Gm-Message-State: AKwxytdb+v84DRnS9KIQCiHEB+hY3YdjKp5xUsLPrMc2upaq6DyZK76L
 J7qfh10ipEYQ2E9f6srbTS1hwD0TuVUWF8wufgFSUA==
X-Google-Smtp-Source: AH8x227TKJYkVxSTxeYAk7XWRpQv8Z8JZ34LaDCfu3nbunAsxW/Oj0k/FQwu5E+lyU+OxgaiB+H5d7Carrx1spKVpGk=
X-Received: by 10.55.53.134 with SMTP id c128mr4369517qka.279.1517329249940;
 Tue, 30 Jan 2018 08:20:49 -0800 (PST)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.140.96.78 with HTTP; Tue, 30 Jan 2018 08:20:29 -0800 (PST)
In-Reply-To: <CACPK8XcLF+hw_gRM76fgJ9tPNZYr3_RiN=euOzw8KLOJ11ibXA@mail.gmail.com>
References: <70e1d00f2f9abaea58ff3710d4fbcbff@linux.vnet.ibm.com>
 <7857d6b0-5c9b-63c1-4216-a737513a3f5a@yadro.com>
 <1517207425.21006.27.camel@aj.id.au>
 <87shaoymux.fsf@linux.vnet.ibm.com>
 <CACPK8XcLF+hw_gRM76fgJ9tPNZYr3_RiN=euOzw8KLOJ11ibXA@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 30 Jan 2018 09:20:29 -0700
X-Google-Sender-Auth: TUdb1-qeVSNrzJucIFYfQpH5Fq0
Message-ID: <CAPnjgZ0hTpmxfL2dhnQBftdhZOUrv8GfF7RHSYahGb7+Ok2qaw@mail.gmail.com>
Subject: Re: BMC Image Signing Proposal
To: Joel Stanley <joel@jms.id.au>
Cc: Stewart Smith <stewart@linux.vnet.ibm.com>,
 Andrew Jeffery <andrew@aj.id.au>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Alexander Amelkin <a.amelkin@yadro.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Jan 2018 16:20:54 -0000

Hi Joel,

On 29 January 2018 at 23:18, Joel Stanley <joel@jms.id.au> wrote:
>
> On Tue, Jan 30, 2018 at 3:17 PM, Stewart Smith
> <stewart@linux.vnet.ibm.com> wrote:
> > Andrew Jeffery <andrew@aj.id.au> writes:
> >> On Fri, 2018-01-26 at 14:07 +0300, Alexander Amelkin wrote:
>
> >>> 2. U-Boot already performs image checksum validation before booting a
> >>> FIT image
> >>
> >> Typically the rootfs is not part of the FIT, so it will not be checked.
> >>     Some systems supported by OpenBMC directly mount the rootfs rather
> >> than booting through an initrd, which makes rootfs authentication
> >> somewhat tricky. Regardless, with signed images we should expand the
> >> FIT hash check to be a full signature check.
> >
> > dm-verity would solve that (for a ro rootfs).
>
> dm-verity is a worthwhile technology, but being based on device mapper
> and therefore block devices, we can't use it for MTD devices, which is
> all of the upstream OpenBMC machines at this moment.

You could use ubi to provide a block device, I haven't tried it though.

>
> I would suggest using some kind of pre-mount verification of the raw
> MTD device against a stored checksum would be the way to go. This
> would imply the use of an initrd (as we would need somewhere to store
> the tools that do the verification). The initrd itself would be
> verified by u-boot checking the FIT.
>
> Future contributors to OpenBMC that have eMMC hardware do have the
> option of using dm-verity.

Are you saying that dm-verity does not work with eMMC, or something else?

Regards,
SImon
