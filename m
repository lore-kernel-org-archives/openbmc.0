Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="puGbschz"; 
 dkim-atps=neutral
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43lQcP06wqzDqGk
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jan 2019 13:11:00 +1100 (AEDT)
Received: by mail-io1-xd32.google.com with SMTP id s8so3340391iob.13
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jan 2019 18:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2dWgR+6Q5j48c73StPcyL8rNKihy77Ts+reLgiTbnI0=;
 b=puGbschzHwJRh84rJ2q7neQkp5Djggu5X5g4PK4uVAKyZc3Bd6MN70kzqt7UhVwoSq
 RBQVF1hRDcqLPj185KMQUudxoXC4ej+bBnM+2Cdrz9T+g/LbdEL4Qzucv0I5LiPfXQq6
 8hgjcE/MNFpB6kcBg3UdI9FZWI9J3eA2AG4N4gyBpPzVJ0rYutvbIjBGEX6n4Qb5ok+Q
 Pj+KRHscQmfl9i6Cu0uC69wFbqN94GUj7APkJMlekH+ch/a24/vzHLk6k6CzL7lg6LS1
 elyjciz88oL3iWfRfmSg1aFgjrfsigV+uTtKXYu40C7KyjTVGHfgmjyR70p5xb4v8LOm
 H2GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2dWgR+6Q5j48c73StPcyL8rNKihy77Ts+reLgiTbnI0=;
 b=N4RzPus1RTFjPacyFrg8nLIAxz5CSV7ZhevDkQzBQ3752RjG4QWnIUlDy9Fhm+DckM
 6bbjFfQg7AQYbPuxVETUbM+6tuMsnWlZxOADkf+ePgdnsBW6sy+/gUeYxuzgj5K6OzgH
 Fx7wHm5n9K4FiExpo9S7IvUryPBcO6UC7Z3lFWesiJnk98YCQXR4KrUW6v7SUn2sordV
 qAMb958/kj1bZhD3Azgib9sfLFsIAxj1z2+xK8Wt6Oj+wNwMpRWjyVlQaUpxQitEpc9+
 spW7D5OAPkT0koTzmf3u72fkPdx8cZVXUFjOwTn5CEF9gVav/hCySLiP7bAMYzQUTbSj
 tUtg==
X-Gm-Message-State: AHQUAubAypVDwJrCLNlfvgCjGuDF+5mrq1z/ObAFC5lVIw4RxWYW6kat
 b2q7CMomALcxxQjSBycQ6EdN04e8KC0PyG71NKc=
X-Google-Smtp-Source: ALg8bN7N5BbWZrf1GEnP3KmezyzZQTXG6C0+scL+N5h/4xNV7DJeX2u8MwXann3+5Agc0oIC6oyVS8pkuyR9O3kDRus=
X-Received: by 2002:a6b:3a45:: with SMTP id h66mr2608391ioa.156.1548295858351; 
 Wed, 23 Jan 2019 18:10:58 -0800 (PST)
MIME-Version: 1.0
References: <3817431548258966@sas1-fc7737ec834f.qloud-c.yandex.net>
 <9F5DFCC3-67E6-48D8-B189-D3A4A7569451@fb.com>
In-Reply-To: <9F5DFCC3-67E6-48D8-B189-D3A4A7569451@fb.com>
From: Lei YU <mine260309@gmail.com>
Date: Thu, 24 Jan 2019 10:10:42 +0800
Message-ID: <CAARXrtkdNAPRNT7kVTDEpmUiVWxT3WXekv+tpbS_woSFMmboKA@mail.gmail.com>
Subject: Re: New motherboard to port OpenBMC to
To: Vijay Khemka <vijaykhemka@fb.com>
Cc: Konstantin Klubnichkin <kitsok@yandex-team.ru>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Thu, 24 Jan 2019 02:11:02 -0000

I have some how-tos on
https://github.com/mine260309/openbmc-intro/blob/master/Porting_Guide.md
That is based on an old OpenBMC release, but most of the content is still v=
alid.

On Thu, Jan 24, 2019 at 1:58 AM Vijay Khemka <vijaykhemka@fb.com> wrote:
>
> Hi Konstantin,
> I am working on howto for sensors, temp etc. I will post it here in coupl=
e of days.
>
> Regards
> -Vijay
>
> =EF=BB=BFOn 1/23/19, 8:02 AM, "openbmc on behalf of Konstantin Klubnichki=
n" <openbmc-bounces+vijaykhemka=3Dfb.com@lists.ozlabs.org on behalf of kits=
ok@yandex-team.ru> wrote:
>
>     Hi all!
>
>     I have the custom-made motherboards for Grantley CPU with Avocent-bas=
ed BMC, and my goal is to switch to OpenBMC.
>
>     I've read HOWTOs in the OpenBMC documentation, but usually the docume=
ntation is usually a bit behind the development, so are there any newer how=
tos or guides?
>
>     Now I took Quanta MB as a reference and going to at least boot up the=
 system and get the network. But it's pretty unclear for me how to add sens=
ors, how to get CPUs temperatures, etc
>
>     Could you please advise what to read to get into details?
>
>     Thanks!
>     --
>     Best regards,
>     Konstantin Klubnichkin,
>     lead firmware engineer,
>     server hardware R&D group,
>     Yandex Moscow office.
>     tel: +7-903-510-33-33
>
>
>
