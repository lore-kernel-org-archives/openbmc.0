Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::334; helo=mail-ot1-x334.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="W2vaABHF"; 
 dkim-atps=neutral
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43kTmj6DrRzDqLD
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jan 2019 00:29:57 +1100 (AEDT)
Received: by mail-ot1-x334.google.com with SMTP id i20so23651462otl.0
 for <openbmc@lists.ozlabs.org>; Tue, 22 Jan 2019 05:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S+dUEpmUinEPt6hOolX6dNbER4f62nxDOsOSTRC5mZI=;
 b=W2vaABHFHHVreszSM+IwS1XbZhiF2u53iz7wPh1I+lgITIGyMqYyUPgTZ4JYeBnoGx
 YI8BskTwzj4yGXVGaUeuc7m6Mn80D6zC6Rx8lMdAg/PoMVc4idfJGIuquroyD0jbwo+n
 2G14Y8gkfvtGB3gNsvubVKHHtUjDZx9k4P/NEfUuL61jPXsacp5lAHJVhVmVEXTX/mCn
 OzVdfQ1UVz3KqwfKczBksFItDQcnTPRq1M4IDkulTaCpx7sD21YylhNnEv2Qw05y29Qd
 nMhk6rh5y/Hwflayj3pBPnCg/iQZRCNcmJfCQ6Is+ogzIUjXEQxhwYFM/wHytEVgqQhx
 T5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S+dUEpmUinEPt6hOolX6dNbER4f62nxDOsOSTRC5mZI=;
 b=UqnColzvqS4jBY7M7BGvOBTuT10zu43Gn85uTapcWaw97iSU17hN/tu7cTgscdABra
 RsAwPZXJ8mGD35CwemePE9ci/+C6TV5clTNfBsroM8OXnBCtCeWTW5vEt3FvrTNfgT42
 iV9ltgijK+oK/VYoxs1EDjPaaSDI8yynsqxR0a3QozObIdQ/g+nbTlFmsAjjshyGq0Ww
 taa4JptLXfKHkJUHa1L2ENtJjhbEQciVDyAXbta5V9+vacoadih7HKcwG99H2ogfQUx2
 dwo2Vt2hvUAoNQqb1oVstyycECnpNLeXOJhpCQ54kFbGSToUrkOtAln93AXwq4qEaNRr
 zp/Q==
X-Gm-Message-State: AJcUukfYRsSfWyNU1fhENzbB8/3lfAbTQRsQAQlZ88WrrVRZNs2062KX
 fnxQg6uo1eCWisdDGN/nDApEb1yTTD1EG+1ZwaY=
X-Google-Smtp-Source: ALg8bN5UuD37G+3fAtLkZJgFJdsC/lRdD89IAWbfdo1LGlccuEz4IfRNWg7MfxbImJCB7SzV617b5wH5k0opvJynsyc=
X-Received: by 2002:a9d:74c3:: with SMTP id a3mr23482239otl.107.1548163795351; 
 Tue, 22 Jan 2019 05:29:55 -0800 (PST)
MIME-Version: 1.0
References: <SN6PR02MB56937EE5CC255D9D877300A4969F0@SN6PR02MB5693.namprd02.prod.outlook.com>
In-Reply-To: <SN6PR02MB56937EE5CC255D9D877300A4969F0@SN6PR02MB5693.namprd02.prod.outlook.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 22 Jan 2019 07:29:39 -0600
Message-ID: <CALLMt=o1wqtaGLKRxLS6Hj5obFUFMaZNZHxc9VZ+=_PLCQdUEQ@mail.gmail.com>
Subject: Re: couple OpenBMC image build and update questions
To: Brenden Lai <Brenden_Lai@jabil.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Jan 2019 13:30:00 -0000

On Mon, Jan 21, 2019 at 1:05 AM Brenden Lai <Brenden_Lai@jabil.com> wrote:
>
> Hi all ,
>
>                I have done my first OpenBMC build with ver 2.6 , it do take a long time .
>                Here is my questions .
>
> Attach screenshot , Which one is the BMC FW image  after building?

I haven't built the default qemuarm image in a long time. I believe
obmc-phosphor-image-qemuarm.ext4 is the FW image.

> Does the image for both QEMU and real machine ?

I believe this default image would only support QEMU.

> How to update it by programming tool like SF600?

Yes, we use the dediprog tool internally to flash fresh chips.

> Does it support online update such as AMI YAFU flash ?

Not familiar with this but once you get OpenBMC on a systems, it does provide
interfaces to update the firmware via a network connection.

The system we use for our CI work is Romulus. This system is supported in
QEMU and on real hardware if you'd like to give it a shot.

https://github.com/openbmc/openbmc/blob/master/README.md#3-target-your-hardware
talks about setting up your TEMPLATECONF for a system and
https://github.com/openbmc/docs/blob/master/development/dev-environment.md#download-and-start-qemu-session
has some pointers on starting your QEMU session. You'd of course need a Romulus
system to flash on real hardware but hopefully it would help you get
comfortable with
building the image and testing in QEMU.

OpenBMC images are very specific to the hardware so before flashing on
your system
 you'd need to ensure you've got all of the different config options setup.
https://github.com/openbmc/docs/blob/master/development/add-new-system.md
is a reference for how to add a new system.

>
>
> Here is the output of my  build
> brenden@brenden-VirtualBox:~/OCP/openbmc/build/tmp/deploy/images/qemuarm$ ls obmc*
> obmc-phosphor-debug-tarball-qemuarm-20190119120630.qemuboot.conf
> obmc-phosphor-debug-tarball-qemuarm-20190119120630.rootfs.manifest
> obmc-phosphor-debug-tarball-qemuarm-20190119120630.rootfs.tar.xz
> obmc-phosphor-debug-tarball-qemuarm-20190119120630.testdata.json
> obmc-phosphor-debug-tarball-qemuarm.manifest
> obmc-phosphor-debug-tarball-qemuarm.qemuboot.conf
> obmc-phosphor-debug-tarball-qemuarm.tar.xz
> obmc-phosphor-debug-tarball-qemuarm.testdata.json
> obmc-phosphor-image-qemuarm-20190119120630.qemuboot.conf
> obmc-phosphor-image-qemuarm-20190119120630.rootfs.ext4
> obmc-phosphor-image-qemuarm-20190119120630.rootfs.manifest
> obmc-phosphor-image-qemuarm-20190119120630.rootfs.tar.bz2
> obmc-phosphor-image-qemuarm-20190119120630.testdata.json
> obmc-phosphor-image-qemuarm.ext4
> obmc-phosphor-image-qemuarm.manifest
> obmc-phosphor-image-qemuarm.qemuboot.conf
> obmc-phosphor-image-qemuarm.tar.bz2
> obmc-phosphor-image-qemuarm.testdata.json
>
>
> Brenden Lai
> SR. BMC Design Engineer
> E&I, Jabil Design Services
>
>
