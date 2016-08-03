Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s4MrY2hyZzDqRt
 for <openbmc@lists.ozlabs.org>; Thu,  4 Aug 2016 05:02:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=OxHmMHqy; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id a135so3075208oii.1
 for <openbmc@lists.ozlabs.org>; Wed, 03 Aug 2016 12:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=Tbn2UQlha5UxgoUqPEUeVU052lRd34M5FPoRLgrfzh4=;
 b=OxHmMHqy3AyzzehySRIMz5nzJaeyQ67ufu9R/SRyVzlIMGIV8asJNyHbmhgk79iEPs
 YW7r4XZXKeAK44rlfJ/OzX4qJf+z/FZ0fbLfXWX0tBTWgaOpBWzLRO+LxsemuJ7Yike4
 U2hWbm8uAb9NNxX7bSFYOV4KtECYht14BtJZ+Z+j0CPfguwIJtwfOvBuiH134GeV9BYY
 SkswJPXLLdzj3AotjGcV/4KakmjXDZxm5494g8+ZzinQ6Kfa43M6hcypP8jyEnGd0B9f
 Mb8IydxHaWB16mgl3DJoNu9Raj5/gyFy4ZPauAeNmGUZbXBHtkJ3O02h4BCEZYUhkEU8
 wHHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=Tbn2UQlha5UxgoUqPEUeVU052lRd34M5FPoRLgrfzh4=;
 b=Zckm5r5xRSOcCDp7aPkShsUc6jZ2db4R4NBE8Wgpl0mtpkiae+u6ToMRsT2W3a7Daf
 n5GEdXxTMTnN45821GfvTHP1i8O3F6WqNJhwZz8gPlGpApDZhmTpx7eUhDAzwfDqBHO3
 qe6ZhfFit+3Cft3Cm4Eyf8vOlJ/hUsmtq/1qaiR71E3L8jGEdwq8N7Yp4Frm1hWv7YWl
 wA/NYZ5hb5rOhFmY6lzMeg3OfaNXlhD/BNEvpPJaSKKVcSLqug0Sjql84k9d7pbzjcxI
 /+AYJY+ppmGOMME7g33ZFTPKclQacG/6RJdUhZWVVGM15ODWl1jaRRXP3joT6mntljRC
 4mdQ==
X-Gm-Message-State: AEkoous1UGEn5g835+BRKtdy6zlz0zfJ6jXG0DWZMAX/SD9BiWNZhlLh8/QJ6HwXTx4ZBrHbY8yXTW7KbhCeVg==
X-Received: by 10.157.11.112 with SMTP id p45mr13009233otd.21.1470250939119;
 Wed, 03 Aug 2016 12:02:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.196.198 with HTTP; Wed, 3 Aug 2016 12:02:18 -0700 (PDT)
In-Reply-To: <20160803180756.n273bodke56yjrqc@asimov>
References: <1469729698-37246-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1469729698-37246-2-git-send-email-christopher.lee.bostic@gmail.com>
 <CACPK8XcejiEOpOyS4sxsYZwsLf=9XKm3sS6nf0g6=hj7A=WMzg@mail.gmail.com>
 <CAA0LjjVPCaG4x_=HvSaK-t7+iaN==0M+7DUnAEjxmj5eUg+Qew@mail.gmail.com>
 <20160803180756.n273bodke56yjrqc@asimov>
From: Christopher Bostic <christopher.lee.bostic@gmail.com>
Date: Wed, 3 Aug 2016 14:02:18 -0500
Message-ID: <CAA0LjjWG6DWAdELUt+ytGdUoPfXF9FgqCmAuMNS+rAmegxfKeQ@mail.gmail.com>
Subject: Re: [PATCH linux 2/4] drivers/fsi: FSI master initialization
To: Patrick Williams <patrick@stwcx.xyz>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 03 Aug 2016 19:02:22 -0000

On Wed, Aug 3, 2016 at 1:07 PM, Patrick Williams <patrick@stwcx.xyz> wrote:
> On Wed, Aug 03, 2016 at 12:15:46PM -0500, Christopher Bostic wrote:
>> >> +struct primaster prim;
>> >
>> > Why are we statically allocating this? What happens if my system has
>> > two fsi masters in it?
>> >
>>
>> FSI hardware, as it exists presently, does not allow for more than one
>> master on a given bus.   There must be a first master in the chain to
>> initiate communications, here its called 'primary' master.   There can
>> be other masters downstream but that function is not planned for
>> addition to the core function.  That's an extended capability.
>>
>
> Typically designs are BMC -> P8 -- Cascade --> P8, but is there any
> reason why we cannot attach multiple P8s directly onto the BMC?  With
> SoftFSI you would just need to dedicate an extra set of GPIOs, so it
> seems very reasonable to do.  Thus, it would effectively create 2
> independent buses each with their own master.  Having a single variable
> doesn't allow this, does it?
>
> --
> Patrick Williams

Its all in how we decide to group the functionality.  Existing FSI
hardware on FSP-2 has a single primary master which can have 64 links.
  If we dedicate another set of GPIOs those would just be considered
another link on the existing single primary master - or so I had
assumed we would look at it.   Each FSI link being a SDA and clock
generic I/O line.   I don't see any advantages to having multiple
primary masters with a single link each but maybe there is and I'm
just not seeing it.  Let me know.

Regarding BMC -> P8 -- Cascade -> P8 that function will be in place
after core function is provided.  That topology has a primary FSI
master with a hub master chained downstream which wouldn't require
more than the single primary master as exists right now.
