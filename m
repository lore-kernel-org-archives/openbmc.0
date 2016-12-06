Return-Path: <eajames.ibm@gmail.com>
Received: from mail-wm0-x244.google.com (mail-wm0-x244.google.com
 [IPv6:2a00:1450:400c:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tY4PL0ChhzDvk0
 for <openbmc@lists.ozlabs.org>; Wed,  7 Dec 2016 01:53:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="zhlGPjRd"; 
 dkim-atps=neutral
Received: by mail-wm0-x244.google.com with SMTP id m203so21939721wma.3
 for <openbmc@lists.ozlabs.org>; Tue, 06 Dec 2016 06:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=ZzEcg36qgZyWl+UufqaF8G7aD51QeO9hrwAZrLY9aGY=;
 b=zhlGPjRdSdiom5OFx4NQ4jmNxi+ipSH9jL3OqSSlwhfHDwa8AIpx968MSrjsD7+pe1
 LRYkNYtFMNTcTIVqqm/TFlfyHuPAlmQaVqLHD1xsu7ATwwuZdNiG9BuuUy+FNAoqcDgn
 OY2VDPs3vxbY7aSl275b888o5+wK0CiMMGgFo5swn8jTF9FTzzfrDxAb3j26I3C5abR8
 kjWEaRthFxFBSssNbUoMP3fisXFhk5D9Bw5cUFLS63okfndDSK4Mr4LE63mAOR9JD0lE
 r5YCRaKDeDShmyKM/DhgIImmz7YM/37K/nFqrIsybEcpj3GmmH2K8rkVkWUDum140Y9A
 SRrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=ZzEcg36qgZyWl+UufqaF8G7aD51QeO9hrwAZrLY9aGY=;
 b=IFOwDLjg9iHEpEySzzA7M57XjtTl5Lzk3Uy2ow48qjigaSPCTCXLWucVC1zEwLkffL
 XJBpA6IM2QhEl98Zhc5XeF1f6QjTW9l+IEoIrO8jZNe+g/KsMiJsTp5HTFFfrMoIUSHf
 A4IrGUAZFJS7PfZeKrrwcA8xJ114B+2Rmk8xN7OX0h0+aiw7d9IJWtgMzbu8Fl0hiViZ
 1k3hw+eU5eL/19wCpxlQ/1ibgKkQBoVMfRBZIX8HCunVDk0LdpYwJKWhyvYEiaGjaALL
 6oXdUF3izZWK21RkzFrJdW/SM/OaLxgtXLCFcMSnqkLY3Cpu7/bIJGgwUOBeLu4C+r6/
 4E0w==
X-Gm-Message-State: AKaTC00YK4bD3F+PspkokR3noJ/tZyBZIW9BsxDZHF8cbk+5hwByzpEpHrEeVM7bRl33bpz9MzKV6L8ZeJnBbg==
X-Received: by 10.28.224.5 with SMTP id x5mr2905684wmg.70.1481035986904; Tue,
 06 Dec 2016 06:53:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.37.229 with HTTP; Tue, 6 Dec 2016 06:53:06 -0800 (PST)
In-Reply-To: <1480468149.2503.100.camel@aj.id.au>
References: <1478560512-23791-1-git-send-email-eajames.ibm@gmail.com>
 <cover.1478835488.git.andrew@aj.id.au>
 <CALpMbd=ORWLG-D69YBr-xZ_E1zm=JtWKjeWWuMjw+sLFX1NbQQ@mail.gmail.com>
 <1480468149.2503.100.camel@aj.id.au>
From: Eddie James <eajames.ibm@gmail.com>
Date: Tue, 6 Dec 2016 08:53:06 -0600
Message-ID: <CALpMbdmjvqdmNQ6D96=2X0LmdCN0mf_=bEvWhjbdR+PWxKwqbw@mail.gmail.com>
Subject: Re: [RFC PATCH linux 0/9] On-Chip Controller (OCC) hwmon driver
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>, "Edward A . James" <eajames@us.ibm.com>, 
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
X-List-Received-Date: Tue, 06 Dec 2016 14:53:10 -0000

Hi Andrew,

What's the status on this? I last sent out a tested patch set that I'm
pretty happy with. I'm not sure what the next step for me is, any
ideas?

Thanks,
Eddie

On Tue, Nov 29, 2016 at 7:09 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Tue, 2016-11-29 at 16:58 -0600, Eddie James wrote:
>> Hi Andrew,
>>
>> Thanks a lot for putting together this new patchset! On the whole, it
>> looks very good! The split between sysfs, occ, and hardware transport
>> layers is solid. I'm pretty satisfied with your modified structuring,
>> although I had a couple of comments and questions. I'll send those out
>> in the applicable patches.
>
> I've just finished replying to your comments. The most controversial
> one was the cap_names/num_cap_names problem, but we have some
> alternatives there.
>
>>
>> I also tested this on palmetto and barreleye systems and fixed a
>> couple of bugs.
>
> Great!
>
>>  I went ahead and put them in a new patchset, which I'm
>> about to send out. For reference, here's my only diffs though:
>
> Good ol' void conversions eh.
>
> Thanks for testing!
>
> Andrew
