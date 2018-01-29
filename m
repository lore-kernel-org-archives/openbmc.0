Return-Path: <sjg@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400d:c0d::242; helo=mail-qt0-x242.google.com;
 envelope-from=sjg@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="BAVGPuTS"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="F7ML3MlU";
 dkim-atps=neutral
Received: from mail-qt0-x242.google.com (mail-qt0-x242.google.com
 [IPv6:2607:f8b0:400d:c0d::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zVYrl2ysfzDqhW
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jan 2018 02:51:03 +1100 (AEDT)
Received: by mail-qt0-x242.google.com with SMTP id s3so13206346qtb.10
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jan 2018 07:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=wuOgEkTtAi7adZoYox24y2LwkYNnRnmy3aOuWhldAyc=;
 b=BAVGPuTS2Qv3aSf1vU/QwnXau72pGQplN1V8+mUF3wOCPTqQ3rRRqNN6LKuKQevF9W
 EHIjqgxGSx81q3zD9VDCvRaYNXZE8c2qdvpN4SLcWUB+7tGHvIdf3mPJzJmmibiZv59C
 7MAqXbTht0a6wtqdis2eZGtl8eqnb8Bw9sAaLUb3k/4LmP4UOQGrcKmqMT4J6ME7KJi3
 5JuERsMGjvGlGqPWTzmgCsgqc65aAZyL/cNW+HGbqup0uIxbU0t1n8HUrTHZb2D05az/
 lRDZs+FcwFQ3ToBi6gFizHCpJXDaEAnqMhpbJNRUFd4EuGoeROIDv/MOYGoFAMrOMF3g
 Ikjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=wuOgEkTtAi7adZoYox24y2LwkYNnRnmy3aOuWhldAyc=;
 b=F7ML3MlUIAvmZZvWn7k+bIMhzfIJAe24fOLled6Wh+kHiv2y+2RQI0Iia30ps9wZpW
 XnI9Ljlj1ZAtYNW8tvJm/+5+SDECCIVLnsIOxOztIGztJ4tb58QbkQcU/mY3z/s/cJkV
 zvd+/vGgMGOJ0zcvoccXpEKJuxDtSAhfNnpYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=wuOgEkTtAi7adZoYox24y2LwkYNnRnmy3aOuWhldAyc=;
 b=TJ1kyKzqYWPDzXYjYOafVfXMUAeykzLQ4KD9qIGrozF1nEJrAa6Rp/0PqSjn7OP3J9
 89oDbKghvwtFlcpqty/WpTQfPOo+8P0tZu1r/tI6vgldUJIWhhj05rMNdLgv5t4g2tH1
 BEURjhoCs0g4HV/NIQ4uifdzr8pHA+CBrsPrAGQHp+efgEUAQbcuyc8mJKirYuZue9a5
 89E2nAwUrQz5hAZlW98rgrEmuHRhC+hz5Qw+4YIVs5pVfUD5htCY6WGB0NL+HggLArtS
 j/HGaJPhG2Ih9aid89wV0RvF4Zfx9qRDoHAZF7TNy3BTyNdDfUkrMy2sAMK1JVYKQC1l
 1XBA==
X-Gm-Message-State: AKwxyte6yibfcECZj813RyRfqs9JismnCDwVFFu40QrARL/RgAq/lbYn
 Xex3jHB8ppBvslNlfxMmzhtCbEjWLzvghG0hIXmjgw==
X-Google-Smtp-Source: AH8x227DGfGriUksSax3JWlLgGyvjEVdJSa63lr0yy306CuDVHs2DKbzmSWtReBppXjZWFyvUajzncLvI3Zyzr9AsuE=
X-Received: by 10.237.61.175 with SMTP id i44mr41057214qtf.89.1517241060478;
 Mon, 29 Jan 2018 07:51:00 -0800 (PST)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.140.96.78 with HTTP; Mon, 29 Jan 2018 07:50:39 -0800 (PST)
In-Reply-To: <1517207425.21006.27.camel@aj.id.au>
References: <70e1d00f2f9abaea58ff3710d4fbcbff@linux.vnet.ibm.com>
 <7857d6b0-5c9b-63c1-4216-a737513a3f5a@yadro.com>
 <1517207425.21006.27.camel@aj.id.au>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 29 Jan 2018 08:50:39 -0700
X-Google-Sender-Auth: _-2hDXGrMepjFI_HIq4_f7blc04
Message-ID: <CAPnjgZ3_ZfbnDfjq1zPM6eAN5_3aTzNn8OcFqOgVoKYwu+9=Hg@mail.gmail.com>
Subject: Re: BMC Image Signing Proposal
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Alexander Amelkin <a.amelkin@yadro.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 29 Jan 2018 15:51:04 -0000

Hi,

On 28 January 2018 at 23:30, Andrew Jeffery <andrew@aj.id.au> wrote:
> Hi Alexander,
>
> On Fri, 2018-01-26 at 14:07 +0300, Alexander Amelkin wrote:
>> Hi, Anoo!
>>
>> The thoughts are as follows:
>>
>> 1. BMC usually runs in a secured environment where probability of
>> tampering with flash IC contents by means other than BMC's firmware
>> itself is negligible.
>
> This does bring up the issue of developing a threat model to develop
> against; we should probably do that. However, without one, I feel like
> we should design *for* defense in depth and allow people to remove
> protections as they see fit for their environment, rather than make
> potentially compromising assumptions about what that environment is at
> the outset.
>
> For instance, whilst BMCs might typically be isolated from customer
> traffic on a separate LAN, there's still the in-band interface which
> can be used to poke at the BMC. Vulnerabilities in the IPMI stack could
> lead to BMC compromise and undesirable flash writes*. Therefore BMC
> flash integrity remains a valid concern despite network isolation.
>
> * This ties into Michael Brown's talks of isolating daemons to their
> own user/group and enforcing SELinux policy against them.
>
>>
>> 2. U-Boot already performs image checksum validation before booting a
>> FIT image
>
> Typically the rootfs is not part of the FIT, so it will not be checked.
>     Some systems supported by OpenBMC directly mount the rootfs rather
> than booting through an initrd, which makes rootfs authentication
> somewhat tricky. Regardless, with signed images we should expand the
> FIT hash check to be a full signature check.

If you use an initrd in the FIT, it can be checked in the same way as
the kernel. FIT supports a full signature check.

If you use a separate rootfs, verity can be used if it is read-only.
Otherwise I am not sure.

>
>>
>> 3. User input really needs validation, at least to make the system
>> fool-proof
>>
>> Having said that, I suggest that the only thing that really needs doing
>> is signing (and checking) of the overall firmware image file that is
>> supplied by the user (admin) during the firmware upgrade procedure.
>> Applying asymmetric cryptography to a digest hash looks to me like a
>> good idea as it indeed allows for verifying the supplier of the firmware
>> image.
>
> Agreed - do Yadro do this already? If so, what did you do to integrate
> image signing into the build process? If not, then I'd be keen to keep
> the discussion alive on how we can achieve it.
>
> Cheers,
>
> Andrew

Regards,
Simon
