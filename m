Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::22c; helo=mail-io0-x22c.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="skm1T/36"; 
 dkim-atps=neutral
Received: from mail-io0-x22c.google.com (mail-io0-x22c.google.com
 [IPv6:2607:f8b0:4001:c06::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40qmQY3cL1zDqL4;
 Tue, 22 May 2018 16:46:44 +1000 (AEST)
Received: by mail-io0-x22c.google.com with SMTP id e12-v6so17200062iob.8;
 Mon, 21 May 2018 23:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=4mhqLu9VGYPnHJVKCAX3bPng736QM3zpC3eGR2Qmzg8=;
 b=skm1T/36ttcxdEYGvCRl/hcuRhNXiunc63S7JeD1fWco6FQiYr4UDXaG/9pyuxDJxQ
 MibKX8bkoY5afXFBI5xMBF8jpU7vTZGaIr1H+HD3LU+tLyMXqujfBCTbybP8KcbPGP1S
 jy2//4rh+oDPNnLIsHd6SduNHgwBkWQu4zkM8KHQu8uQIEIqpsllXjKBqeOZQWUQo0mc
 TwazbQ0H5tGYdthjUPF6yxS0rVpJM96vLvI78WOe+SA6IrS6mcRicqILVIdI2vxgDSJA
 TxeXJPhyTh+ZDX6g1ih2KiV9yOP7WlrjOlG1JJGnBCYKC1Zi7kZTCi4Dbyc/B2iiTWYA
 wEJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=4mhqLu9VGYPnHJVKCAX3bPng736QM3zpC3eGR2Qmzg8=;
 b=aFYxAYbOc7+ltB6lzX6U6xIRUunXPgf9PWF9IgXG2+DtSlGry8QgAsok/T31tz6aid
 7Zik9bQ7LJQTJxIZauL/SLGiJ5quc9CcsIZI26eDrIz5pYY8f0N08GAeVLR16N1J0AJe
 2EBUDPsNfIST9nRjRBr/HD0J7j+2hhQ3MnrGKJlCSFb/nwJqXwLKtofilvAZqqC5bCC4
 o45TN27n4GAsY39o2VIfTCrpZDERc8Lr6iZiOykt0v5rTdLpWCh/blT/uzhDwK8ff+JY
 oIc3hIHnPMBvKA6tqoO6WDMTG7jKbd5t5ijcS6vZxmg4svVRdItVb/90xqOXJjPXKO6u
 rbvw==
X-Gm-Message-State: ALKqPwcXbDAmtHuYchoXVbio0ej4dGbeiThdy3NCx/uVELFm6JN5fhJl
 XRvYCwvqb+tGaB48JOdUnZn9H10gZGQVWs4p/yU=
X-Google-Smtp-Source: AB8JxZq8lpFLlOaOKitgE69z/HpFXX4ykABzzRqkeuqspPzOkivsVMFK+P9pFWGJgNtZ2dPVti1ptkKX5rAgoPQYhSM=
X-Received: by 2002:a6b:a50c:: with SMTP id
 o12-v6mr23952581ioe.16.1526971601471; 
 Mon, 21 May 2018 23:46:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4f:558a:0:0:0:0:0 with HTTP; Mon, 21 May 2018 23:46:40
 -0700 (PDT)
In-Reply-To: <20180518210254.GC105329@mauery>
References: <87lggezywe.fsf@linux.vnet.ibm.com>
 <3d38bc878a5b36f9091588d1fb842c1e@linux.vnet.ibm.com>
 <8172868d02b4f54ceaa101ba1c99fa5b@linux.vnet.ibm.com>
 <874lm8pjd7.fsf@linux.vnet.ibm.com>
 <e1431b039c817b23b49b6f5833760152@linux.vnet.ibm.com>
 <CAARXrtn6M=tzE-yMJWN4yaSHZJUYksMT=vMvVymY0kvgQJ4bfQ@mail.gmail.com>
 <MWHPR21MB0864432C6CB8EF9A575589B0D6930@MWHPR21MB0864.namprd21.prod.outlook.com>
 <20180516160209.GB105329@mauery>
 <CAARXrtksFbirzq70cLzvWRcxKxOT9rGYKPMa-+UQcMpvx0=ycw@mail.gmail.com>
 <435d4ae31bb1d8c4c06ec95cca51b5d2@linux.vnet.ibm.com>
 <20180518210254.GC105329@mauery>
From: Lei YU <mine260309@gmail.com>
Date: Tue, 22 May 2018 14:46:40 +0800
Message-ID: <CAARXrtnTfgsFNvB4UTBw0_3QodeuCdmG51kAbtdEAMBffffsFQ@mail.gmail.com>
Subject: Re: BMC Image Signing Proposal
To: Vernon Mauery <vernon.mauery@linux.intel.com>
Cc: Adriana Kobylak <anoo@linux.ibm.com>,
 Adriana Kobylak <anoo@linux.vnet.ibm.com>, 
 Stewart Smith <stewart@linux.vnet.ibm.com>, Yugi Mani <yupalani@microsoft.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 openbmc <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 22 May 2018 06:46:46 -0000

On Sat, May 19, 2018 at 5:02 AM, Vernon Mauery
<vernon.mauery@linux.intel.com> wrote:
> On 18-May-2018 11:01 AM, Adriana Kobylak wrote:
>>
>> On 2018-05-17 22:33, Lei YU wrote:
>>
>>> So I think it is better for OpenBMC project to have a common (or example)
>>> image signing tools/code, not for a specific machine or product, but for
>>> the
>>> general machines in this project using legacy flash layout.
>>> Let's discuss and get a design proposal?
>>>
>>
>> Yeah, ideally we'd converge the legacy and ubi code update methods into
>> one, to take advantage of the Software D-Bus interfaces and have the
>> different features like signature verification, filesystem mirroring, etc be
>> able to be picked up as separate packages. One starting point for the design
>> proposal would be to determine how to separate in the build and the repo the
>> different code update methods. Lei, want to take an initial stab at it? :)
>
>
> As far as the update methods go, just using a descriptive payload goes a
> long way. Historically, using a manifest type thing that told the update
> mechanism which bytes to write to where was pretty simple and very
> effective. The update mechanism would check the authenticity of the payload
> before trusting the manifest, but then the manifest and payload would all
> get written to the flash. This was for specific flash offsets and did not
> fully comprehend the notion of A/B or other redundant scenarios, so all the
> offsets were relative.
>
> But doing something in the manifest so simple as this would work for a
> variety of scenarios:
>
> MANIFEST:
> purpose=xyz.openbmc_project.Software.Version.VersionPurpose.BMC
> version=v2.2-32-gc6712d3-dirty
> KeyType=OpenBMC
> HashType=RSA-SHA256
>
> # Expected is a list of files alongside the manifest
> Expected=part1,part2,part3,partN
>
> update_pre=<target to activate prior to fwupdate>
>
> # obmc-flash-bmc-by-name knows where to place this part by name
> # (e.g. u-boot always goes at 0x00000000)
> part1_update=obmc-flash-bmc-by-name@.service
>
> # obmc-flash-bmc-at-offset places a part at a fixed offset
> # optionally relative to an optionally specified MTD partition
> # (default relative to /dev/mtd0)
> part2_update=obmc-flash-bmc-at-offset@.service 0x130000
> # (default relative to /dev/mtd0)
> part3_update=obmc-flash-bmc-at-offset@.service 0x130000
>
> # not a ubi person, so I can't comment on all the options :)
> part4_update=obmc-flash-bmc-ubi@.service
>
> partN_update=<service for updating partN>
> update_post=<target to activate post fwupdate>

This is interesting, and it looks like a general method for code updating to
support both non-ubi and ubi layout. (Though it would require code changes in
phosphor-software-manager).

I have several questions though.

Background:
* For non-ubi, there are two ways to do code update:
   1. Copy image-bmc (or image-rofs, etc) to /run/initramfs, and reboot.
      A updater script in initramfs will run to program the image to flash.
      During the code update, BMC is NOT operational;
   2. Invoking "prepareForUpdate" method to ask BMC reboot into a ramfs, then
      invoking the updater script to program the image to flash.
      During the code update, BMC is working.
   3. There is not WebUI support (yet)
* For ubi:
   1. The update happens when BMC is working (due to the fact it assumes the
      flash contains enough space for two images).
   2. The WebUI will upload the image and "activate" it when BMC is running.

So here is my question: to support non-ubifs code update in a general way,
should it do "prepareForUpdate", making BMC to reboot into ramfs, or should it
do the update during reboot?

* If we prefer the "prepareForUpdate" way, then the WebUI should add this
   function to make BMC enter "update" mode;
* If we prefer to update during reboot, then the BMC will not be working for a
   few minutes during the code update, WebUI will not be working as well.

>
>
> The idea is that we can have a series of service files that can handle the
> majority of operations generically and any special cases can supply their
> own. But since it is just a service, the dependencies are all taken care of.
>
>
> Just some thoughts on how this might be done. This is actually something
> that I am working on right now, trying to get our redundant image booting
> working internally, so I am glad to hear that others are working toward
> similar goals.
>
>
> --Vernon
