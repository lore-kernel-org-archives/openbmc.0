Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com
 [IPv6:2607:f8b0:4003:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qvqVx2195zDq5s
 for <openbmc@lists.ozlabs.org>; Wed, 27 Apr 2016 16:17:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=FIrwDEy7; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=P0W6i3c6; 
 dkim-atps=neutral
Received: by mail-oi0-x241.google.com with SMTP id i2so5069355oib.3
 for <openbmc@lists.ozlabs.org>; Tue, 26 Apr 2016 23:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=a0J9LmFxL+Q0Ac/cgEgGQrUd4aj2kZh39vSDvoKIUoM=;
 b=FIrwDEy74K/oS1pwrNUzWLzUA3cRXkf76bMuE0GV+bB3o50NrMkyNPFw02LMNDGvRJ
 UM1HMoDXh+ZpeWcpa2TouhyliqTeqVhO8xKIL4SfMKUjjLhEFBT1q73GMj9OPfUEBnT0
 KcLYz6BeDhLFRIpQ7EBlLIzv5oyBa9KHGlaq9VtjTxKEbbICUAaZnQR/8ZOwvmsJ4v1+
 WhmKsZQP5LqlcDnQd3HMywEosRAu+9ipJGFxS4Df9KE3lfvEvQOf/cEK35T/Zj+cgjyf
 NAnrsmvw8W4kflZtDWtyUj7jqYInTyqkmt1g6CMCo5jbWB4t86QZXJxdHeoZMAV+CKDo
 M1ow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=a0J9LmFxL+Q0Ac/cgEgGQrUd4aj2kZh39vSDvoKIUoM=;
 b=P0W6i3c68yxEmqQrveDRDxkD+vTFyZ/+wxRHumPzH7iQmq8DVOAOcnSNWnVnp3JMNO
 i4YpZZTVzsYd1JUC8T+VNu4XihMucq2xwSRpudc6j/vNEw9Wapy9x5jbSdI683qExiEf
 od/I7euYwi0AzM+nN82t0SDWpJELki26S02dI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=a0J9LmFxL+Q0Ac/cgEgGQrUd4aj2kZh39vSDvoKIUoM=;
 b=aaXE51OaV2mudW8zMPVeZQx6076Uw3bVmgJKS3LVPMY5Z57LK+iJjIduW3p56j8lq/
 5evRjJEJep1LDIFPDxPdlamE3+IDtwYlawFEBom0yAIKCt5uA06AwIoWc1PvnLCuHF37
 NzfKaTGgkJXtZxf/jg6IBVv/eZsBLLvo/Dxg6PkYusV+Uu1SWbnuyZH32uhu8+ERlV3j
 XJ/12FD6iPTSfB+pkgk709RGBqifWmC3fAsAPGJuzYva69zB9H4v3SVPhHpL46Th3S6U
 hiyT6tSHEXbEFlJAudz7SlKagh7mCUu3f7vS5Y4LO4kfmve35jekgPiKvcVaHdQcJFmh
 Zjtw==
X-Gm-Message-State: AOPr4FU6IrrGGIQwv18MJ7RACaK9hpNLV0IxTgVdFyppHVPHaRd6NuYgtmTnMYJyzl413MVRqt5x2KMshRFGww==
X-Received: by 10.202.230.137 with SMTP id d131mr2805689oih.168.1461737831057; 
 Tue, 26 Apr 2016 23:17:11 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.79.200 with HTTP; Tue, 26 Apr 2016 23:16:51 -0700 (PDT)
In-Reply-To: <20160427113845.0ea38dfc@camb691>
References: <1461273629-24609-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1461273629-24609-2-git-send-email-openbmc-patches@stwcx.xyz>
 <20160426103529.2c4ff3fa@camb691>
 <C4DFF7E3-7207-4F86-AB93-E36CF6B31DDC@fuzziesquirrel.com>
 <20160427113845.0ea38dfc@camb691>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 27 Apr 2016 15:46:51 +0930
X-Google-Sender-Auth: nULyiTJNf5hJJDJa3bCZYR69nxM
Message-ID: <CACPK8XfUUC17xk3c19qz69WjKTzs1x_7Nz5NuNhi0gjM5kO2Fg@mail.gmail.com>
Subject: Re: [PATCH openbmc] Build a tftpboot friendly image.
To: Cyril Bur <cyrilbur@gmail.com>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 OpenBMC Patches <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Wed, 27 Apr 2016 06:17:13 -0000

On Wed, Apr 27, 2016 at 11:08 AM, Cyril Bur <cyrilbur@gmail.com> wrote:
> On Mon, 25 Apr 2016 21:04:28 -0400
> Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
>> Yep, thats what it does.  Did you use obmc-phosphor-image-<machine>.cpio.lzma.u-boot?
>>
>
> It appears I had my machine configuration missing a file.
>
> The file spawns now, works great!
>
> I'll add my tested by here
>
> Tested-by: Cyril Bur <cyrilbur@gmail.com>

I really like this idea. It removes some of the barriers for testing
using the openbmc userspace when doing kernel work.

Reviewed-by: Joel Stanley <joel@jms.id.au>
