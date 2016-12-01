Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x244.google.com (mail-vk0-x244.google.com
 [IPv6:2607:f8b0:400c:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tTdq760SbzDvxp
 for <openbmc@lists.ozlabs.org>; Thu,  1 Dec 2016 11:45:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hbe+wr0F"; 
 dkim-atps=neutral
Received: by mail-vk0-x244.google.com with SMTP id x186so9895433vkd.2
 for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2016 16:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:from:date:message-id:subject:to:cc;
 bh=yQv2ptP81dUygR1U1MKtIS+v6ZhOkQoUk7N5EGizldE=;
 b=hbe+wr0FqBqB2fnGWZ0xKuvAAZ1dbyEudEvRVj8jFwV0QbPHkMqOhOUUkpDZ3FWj0u
 xcA8IK0CNv75zQ9krIdpIU4vT6L0xPwkEoGIzNhhQRaT50D/1989SGl6RqAitzW1+QzT
 jlG1yQQ3j4kqIfiY7R3qgbMb6qnyLeOAMOapyTumOrZcoAyanHWghK6Eh506WCnN9oKj
 1VLvUUXdVX9zVeX5Ct7YB9GpG0ROcekYBUFo0Rx0jGs722CsakE9HmEl+MlOSIhNkSac
 RslQLLsbr4LMBvhTJoKwYvcLpRtQJvriPVW3KEGXhjBBxcpUK0FrwhV1yz8e/8hZigiK
 SHgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
 :to:cc;
 bh=yQv2ptP81dUygR1U1MKtIS+v6ZhOkQoUk7N5EGizldE=;
 b=NJIeHGK5GbE1Uw8ZKvIRIapdwsw6L+zc1KMJHKexQ0079I8C+2efdQQ2jcxRcTBd9a
 3YBHGNeoP+ex7Eeeyz4Mxt+arHdAHOsxOP5nDrqH6Ry37hZvXzgeQAzeGYAQbCflCLmX
 /MyTGn0s72H3MKXMYxNzif4Wb+VMweU/pr62+gRbOz7bxbPIAgYA2zFDj5fLu1+k7piu
 h+CvAdkdrZlKkNO4Lhip4TEC551IM5U6JkABXAocaMIhS5QIdA5aYI8CJ4t3EB97c6jC
 rXhiXmKZRSdMItX6Qw994fXJbrq21Ln82eN9QE/pNOPwdP8/uK6DfkdIoEv+tfjW5SM4
 AUBg==
X-Gm-Message-State: AKaTC01u6vDJyw1f1okMqKR8MIH6GOTcSRn3NGGs6DvtS6HSSWoWITXD+gSYyhZBCVqe7XEonrchcG/bTPU9bg==
X-Received: by 10.31.130.20 with SMTP id e20mr11153754vkd.149.1480553105354;
 Wed, 30 Nov 2016 16:45:05 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.48.91 with HTTP; Wed, 30 Nov 2016 16:44:44 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 1 Dec 2016 11:14:44 +1030
X-Google-Sender-Auth: GHa_T2QwBWicQke2e5Fnine8FfE
Message-ID: <CACPK8XeEKvZfAVLgwZ2bKne3uhYiXCSOFgoSfmTd7HqG_K3TOw@mail.gmail.com>
Subject: Upstream patch submission checklist
To: Christopher Bostic <cbostic@us.ibm.com>
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
X-List-Received-Date: Thu, 01 Dec 2016 00:45:08 -0000

Hello Chris,

When we submit the fsi patches upstream we want to go through the
following checklist:

 - Base them on an upstream tag. We have chosen 4.9-rc1 in this case

 - Get your maintainers using ./scripts/get_maintainers.pl. In
addition to the list from this tool, cc them to:

   joel@jms.id.au
   jk@ozlabs.org
   andrew@aj.id.au
   alistair@popple.id.au
   benh@kernel.crashing.org
   linux-kernel@vger.kernel.org

 - Generate your patches with git format-patch
   * use the --to and --cc directives to attach the recipiants to the patches
   * use --cover-letter to generate a cover ltetter
  * As you've based them on an upstream tag, you should be able to do
use v4.9-rc1..HEAD as the range

 - Run your patches through ./scripts/checkpatch.pl and fix the issues mentioned

 - Build the kernel using, checking for warnings:
   * make aspeed_g4_defconfig
   * make aspeed_g5_defconfig
   * make multi_v5_defconfig
   * You will need to enable the FSI options after doing each make
       ./scripts/config -e CONFIG_FSI_MASTER_GPIO
       ./scripts/config -e CONFIG_FSI_SCOM
       ./scripts/config -e CONFIG_FSI_MBX
   * Seperately to testing the options as =y, you should test them as =m:
       ./scripts/config -m CONFIG_FSI_MASTER_GPIO
       ./scripts/config -m CONFIG_FSI_SCOM
       ./scripts/config -m CONFIG_FSI_MBX
  * Build for ARCH=arm as well as for ARCH=x86_64. Others will test
that the code compiles on all kinds of architectures, so you need to
make sure it doesn't generate warnings there.

 - Check that the patches apply to a clean tree
  * git checkout v4.9-rc1
  * git reset --hard
  * git clean -fd
  * Then apply the patches with git am ~/fsi-v1/*.patch

Cheers,

Joel
