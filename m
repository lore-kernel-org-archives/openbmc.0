Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x244.google.com (mail-vk0-x244.google.com
 [IPv6:2607:f8b0:400c:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ssrNF02SrzDrL1
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 17:50:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=nT1jOPwY; 
 dkim-atps=neutral
Received: by mail-vk0-x244.google.com with SMTP id 192so3750060vkl.2
 for <openbmc@lists.ozlabs.org>; Sun, 09 Oct 2016 23:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=60oySLssWCmXS8OFZQUg2FaWom09s6zzTONExvVHlAM=;
 b=nT1jOPwYW8UNmcFXCTNr0wbIcPNubI9tlnc2M1r2wo54JJn1OQHmuLKR8tEc5fY+Ju
 /epbux8JWZqcFVomzkTSLaJbgdGLQBrWiEaCQ7oyCb+qr51YVWak2QslBD5XsK9N4OH+
 PhDcwwrFtKQVFc9KFM8MdrNGY6jDyxHsmkGq1NPoxN4zNbDSAYiVrLRp4I5bO5mTvLa0
 dOg/vL2YzmyGTNsdVtiCXcqW9IKbGYRVax1ADMvx1EHKZuXRHpcS9yjioDQo1f7IVBFx
 RJCD7DvTkgx0ybCQ6J1Lz1xkIFCi63yJRaxLprwfFvLZIRZr+IgEu5kq5o4y1agYGxkq
 jazQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=60oySLssWCmXS8OFZQUg2FaWom09s6zzTONExvVHlAM=;
 b=k57jIC0mT8BFWLVajzwTUjil1fd0PwTsMCG0ROXPKSKLaWzRdmfS0XEvLXEYk8F98j
 3AykKIlidxh2OX/un7UvFzzLPZT5Z2YWHbb14NUrM8gKu1BD3M3c5M86Iw7Mop2rgeZ9
 123yTbcLXpQ3qA7TbfAj4JWA+Wo4RVlicTgZexeWnWtLUo/8L93RpH4DTDLfL9mKrIKF
 ov/Pdv3gxG4+Szm9VpMXvqAUh2BNmMUKfjLm3lzf4CgGlGVBomuq15F63y4nOzKYOag4
 DUkjw4WoRW0tWrZ6aoH/gJel0H+6mGcKxnYHBhCVeuUkfNNePwHJsEUu3IcJXChGQ7Vk
 1LQg==
X-Gm-Message-State: AA6/9RkaTY5iyLNMZcSUJgAk7mJ2wblNwOLlKAkI5dCMlkdhRo9Ac9R1/tLA7U3h2zOq5pY2OlfdKzlcDB/YJw==
X-Received: by 10.31.233.6 with SMTP id g6mr7406539vkh.148.1476082202522; Sun,
 09 Oct 2016 23:50:02 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Sun, 9 Oct 2016 23:49:42 -0700 (PDT)
In-Reply-To: <CACPK8XcoqDt_kGCVVt=B-8T28xJVbOfwYjVk1o=DEQ+DHO1ayQ@mail.gmail.com>
References: <1475789205-19618-1-git-send-email-clg@kaod.org>
 <6450afc7-7750-5282-aecc-408fd3a11df3@kaod.org>
 <CACPK8XcoqDt_kGCVVt=B-8T28xJVbOfwYjVk1o=DEQ+DHO1ayQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 10 Oct 2016 17:49:42 +1100
X-Google-Sender-Auth: u6bhvWThouq0lqUkIfXxSFPCxaA
Message-ID: <CACPK8Xdafw1BiWn+QaJ+Dn13mhMJTaV3HF_G=0s4ofqoHZGDbA@mail.gmail.com>
Subject: Re: [PATCH u-boot 00/12] config cleanups and small fixes
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Mon, 10 Oct 2016 06:50:05 -0000

On Mon, Oct 10, 2016 at 5:24 PM, Joel Stanley <joel@jms.id.au> wrote:
> On Fri, Oct 7, 2016 at 6:24 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
>> On 10/06/2016 11:26 PM, C=C3=A9dric Le Goater wrote:
>>> Hello,
>>>
>>> Here is a set of cleanups on the configuration. It should ease the
>>> port on v2016.11 which is a little more strict on CONFIG_ defines.
>
> Nice one! I had a look at all of the patches and they look good. I
> will hold off on the last two relating to ramdisk until we see what
> upstream say.
>
>>
>> You will need this patch to start with :
>>
>>         https://github.com/legoater/u-boot/commit/d76a5e74286cd903c4eb96=
c3b5f762672121b02a
>>
>> forgot to send it :/
>
> No worries, I will include it.

I can't build the defconfig after applying your patches. I get the
same result with your trees (05fffe5dc0ec39a11c918d1916d349708cd67cf8,
2d1d53622d3155193832992a11d84775e44190cf).

$ make ast_g4_nsci_defconfig
board/aspeed/ast-g5/Kconfig:22:warning: config symbol defined without type
***
*** Can't find default configuration "arch/../configs/ast_g4_nsci_defconfig=
"!
***
scripts/kconfig/Makefile:114: recipe for target 'ast_g4_nsci_defconfig' fai=
led

Cheers,

Joel
