Return-Path: <sjg@google.com>
Received: from mail-io0-x22c.google.com (mail-io0-x22c.google.com
 [IPv6:2607:f8b0:4001:c06::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tTgys18BXzDvxS
 for <openbmc@lists.ozlabs.org>; Thu,  1 Dec 2016 13:21:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ln3mNkp8"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="nUiMlou1";
 dkim-atps=neutral
Received: by mail-io0-x22c.google.com with SMTP id a124so389403692ioe.2
 for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2016 18:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=nPc4aXcWMOangtDtUE07v0vUgNk0d+JK6v00iCpnveI=;
 b=ln3mNkp88/rw3zBzxABEtbSCNtJslt0bJaq0gLjnxIGlHeKM0IGg1+m50mRE+GEGBy
 CwMGiAfd6056iqQnS0d4MXft9eLDn5PktrdDJI7J6Hs8t5MxUOWe3MPJxHm+0mhlKbAJ
 CG5T5D+0NKmHmMi9PSMZO7AKPdLVXlkzLup02522dBUOEgqdBpL0nU3PCtmXDYZD02IT
 V0Tzj7AZg5DtTh5lp0w0h3sT2080M3o/PWNenAcrYBz/vxNyXvM7YkfP72wEK8t96PRu
 b0otbJ4PnDFn/m55vWAAsiCsUMUCStuhKLe0jmMgjg23VlXm35lJ/MMNCLRjlPGRz6rb
 WfpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=nPc4aXcWMOangtDtUE07v0vUgNk0d+JK6v00iCpnveI=;
 b=nUiMlou1F1e1HR8AS9OEZYv4uYilIGsWExd/4J6v7dBiroqkVu3+U1lm9/RRazedT8
 pI1L8QToUvv6HjBPEKTNMg4zII6tyCjMZVhW2c+U37I3KCxW+UEfPP/TSAYXtTbIup0v
 40oJuS2afCtLhWggxtIqDMUlYqvkCudzJfWNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=nPc4aXcWMOangtDtUE07v0vUgNk0d+JK6v00iCpnveI=;
 b=NXMTkBNZlM7xPcDPRE+l7jQdio8rIpfEgJBl/H5ilWeYIGFAwvKZGwqOtb3Xdo8dFM
 W8i8/1icfKmlgWSoZSWAxl/buW3fqUJL7gOXWbOSJZtShx7ZjVB8jBQNVLt+6j5w63+5
 7iVu7CujT56hMI4czhD8SPK2LmNGIwlXrFM7BxQbYEwYvcRgGVo+mY45gG8EE8gtBMDM
 p5qUKRcIc92JOI2lgW64ehqV3cJ5N3wlhBAahTLalYEwA/lfPT0yII4dogt4xAScpI1V
 /eyZtXVUXmCaFP5SoH0sFBu+DUk+VtAvLAFWaXUKRsgUXJ6tP7N5xPaxmxIiAZwAT9Ln
 3G6Q==
X-Gm-Message-State: AKaTC03NT8TU88PkiePBBkjY7MEMPS+m1jig1gQ5mZ18rm0y3fY5II7pI3665Yia5F4Inc/Wrf8UzzBOV7eHZRT1
X-Received: by 10.202.76.201 with SMTP id z192mr17070973oia.42.1480558913893; 
 Wed, 30 Nov 2016 18:21:53 -0800 (PST)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.182.128.229 with HTTP; Wed, 30 Nov 2016 18:21:32 -0800 (PST)
In-Reply-To: <CACPK8XeEKvZfAVLgwZ2bKne3uhYiXCSOFgoSfmTd7HqG_K3TOw@mail.gmail.com>
References: <CACPK8XeEKvZfAVLgwZ2bKne3uhYiXCSOFgoSfmTd7HqG_K3TOw@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 30 Nov 2016 19:21:32 -0700
X-Google-Sender-Auth: niIKDZ_Sd3QsS1YDNE3wxx50K9k
Message-ID: <CAPnjgZ1p2jSYQsv7fw+kjZ1HgSfV3KM9uHhjJE=3RUWfvnB+_g@mail.gmail.com>
Subject: Re: Upstream patch submission checklist
To: Joel Stanley <joel@jms.id.au>
Cc: Christopher Bostic <cbostic@us.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 01 Dec 2016 02:21:58 -0000

Hi Joel,

On 30 November 2016 at 17:44, Joel Stanley <joel@jms.id.au> wrote:
> Hello Chris,
>
> When we submit the fsi patches upstream we want to go through the
> following checklist:
>
>  - Base them on an upstream tag. We have chosen 4.9-rc1 in this case
>
>  - Get your maintainers using ./scripts/get_maintainers.pl. In
> addition to the list from this tool, cc them to:
>
>    joel@jms.id.au
>    jk@ozlabs.org
>    andrew@aj.id.au
>    alistair@popple.id.au
>    benh@kernel.crashing.org
>    linux-kernel@vger.kernel.org
>
>  - Generate your patches with git format-patch
>    * use the --to and --cc directives to attach the recipiants to the patches
>    * use --cover-letter to generate a cover ltetter
>   * As you've based them on an upstream tag, you should be able to do
> use v4.9-rc1..HEAD as the range
>
>  - Run your patches through ./scripts/checkpatch.pl and fix the issues mentioned
>
>  - Build the kernel using, checking for warnings:
>    * make aspeed_g4_defconfig
>    * make aspeed_g5_defconfig
>    * make multi_v5_defconfig
>    * You will need to enable the FSI options after doing each make
>        ./scripts/config -e CONFIG_FSI_MASTER_GPIO
>        ./scripts/config -e CONFIG_FSI_SCOM
>        ./scripts/config -e CONFIG_FSI_MBX
>    * Seperately to testing the options as =y, you should test them as =m:
>        ./scripts/config -m CONFIG_FSI_MASTER_GPIO
>        ./scripts/config -m CONFIG_FSI_SCOM
>        ./scripts/config -m CONFIG_FSI_MBX
>   * Build for ARCH=arm as well as for ARCH=x86_64. Others will test
> that the code compiles on all kinds of architectures, so you need to
> make sure it doesn't generate warnings there.
>
>  - Check that the patches apply to a clean tree
>   * git checkout v4.9-rc1
>   * git reset --hard
>   * git clean -fd
>   * Then apply the patches with git am ~/fsi-v1/*.patch

You may be interested in patman, which does some of those steps for you:

- runs get_maintainers.pl
- creates a cover letter and generates patches
- runs them through checkpatch
- applies the patches to check that all is well (your last step)
- emails them out

It also deals with generating change logs.

You should be able to find it in the U-Boot tree (tools/patman) along
with a README.

Regards,
Simon
