Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x231.google.com (mail-vk0-x231.google.com
 [IPv6:2607:f8b0:400c:c05::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tThgL45GDzDvyT
 for <openbmc@lists.ozlabs.org>; Thu,  1 Dec 2016 13:53:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="aFnnPM2x"; 
 dkim-atps=neutral
Received: by mail-vk0-x231.google.com with SMTP id 137so121551809vkl.0
 for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2016 18:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=girWP2w5BEmRXD2uMAfstK4KzazJ7gA2OmYzz5YrGT4=;
 b=aFnnPM2xJkqis16WBuZMcmWPb9f64f6zepOODQdr2D6nAXFNNkw4ZYrnLnRlUS8SId
 oOz7g3QRGuvsuILO2oQoHizmPO14PytM+WiCJsvszTabbyLiv6J2vOYNkhjHyi64UylK
 /H+9xfYa99yM2tOoRuw3ND5F8ATnLhmuk5aWF86I1D5YYEn9StorDwj6bv4Xsxkj1A+T
 EMkKE2MGw56vfmhQ/il9Hl5fPh2THeRxuMhRIiUFV0YqhtibyFesHgvee/5YLXixkYr7
 Q+C2x2aHLru7pQGAeS1m3mDgdd63Nehl5E0qDgp+sdjAOnaqfYjk33cJxSGSa2rpdQon
 +lWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=girWP2w5BEmRXD2uMAfstK4KzazJ7gA2OmYzz5YrGT4=;
 b=mTiUl5pKMUo8fV4cWS8vZhqbkWJorRpb+R297jaFr0EzH8yGp72hUlV+N2LkOQLXyJ
 kKKDAT+KkmE7BY1kVRMF6xAaigS4XoLbjwFa8uCfWVzv7BbXE84Cxmtfgvp4pBzQ0v02
 A+4LETHr7ToNs2xkKfF/YMvRzGQxBvDMzhJ4LYqe3q2Oe/puYGGxOlzEMVfthp4bJmEf
 9zlw2KfX7ekdddhewXgfhoO3rRTm4P37OVnuKp3hQ0SbfbGUIoPv/Mxji3PHZiAlulcl
 O8rDt4dpqF9VG643OaqqoLjn3N3FVbxnihCK12tZ6H8qdHm1Ha8meeesG9S88wpoHx46
 7WFQ==
X-Gm-Message-State: AKaTC02eGfgXh6Z5VLutsD++XacNcOjhS6+Jnu+9+iIVUxNhpQWKRXrpfX8ufMMr+PcHJ0xTOpIs/D205N/aBQ==
X-Received: by 10.31.49.216 with SMTP id x207mr13468438vkx.82.1480560812007;
 Wed, 30 Nov 2016 18:53:32 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.48.91 with HTTP; Wed, 30 Nov 2016 18:53:11 -0800 (PST)
In-Reply-To: <CAPnjgZ1p2jSYQsv7fw+kjZ1HgSfV3KM9uHhjJE=3RUWfvnB+_g@mail.gmail.com>
References: <CACPK8XeEKvZfAVLgwZ2bKne3uhYiXCSOFgoSfmTd7HqG_K3TOw@mail.gmail.com>
 <CAPnjgZ1p2jSYQsv7fw+kjZ1HgSfV3KM9uHhjJE=3RUWfvnB+_g@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 1 Dec 2016 13:23:11 +1030
X-Google-Sender-Auth: C8jtHEIlHPnpocuF_IrGoqpfUgM
Message-ID: <CACPK8Xf17NE8b6o+uAmOOKPbbAYnUPWiW6OwubywoSBvLaBptA@mail.gmail.com>
Subject: Re: Upstream patch submission checklist
To: Simon Glass <sjg@chromium.org>
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
X-List-Received-Date: Thu, 01 Dec 2016 02:53:35 -0000

On Thu, Dec 1, 2016 at 12:51 PM, Simon Glass <sjg@chromium.org> wrote:
> On 30 November 2016 at 17:44, Joel Stanley <joel@jms.id.au> wrote:
>> When we submit the fsi patches upstream we want to go through the
>> following checklist:
>
> You may be interested in patman, which does some of those steps for you:
>
> - runs get_maintainers.pl
> - creates a cover letter and generates patches
> - runs them through checkpatch
> - applies the patches to check that all is well (your last step)
> - emails them out
>
> It also deals with generating change logs.
>
> You should be able to find it in the U-Boot tree (tools/patman) along
> with a README.

Thanks Simon!

This checklist was for the kernel, but you're right, it applies
equally to u-boot patches.

I hadn't seen patman until you mentioned it the other day. I will take a look.

Cheers,

Joel
