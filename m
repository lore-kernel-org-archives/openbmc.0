Return-Path: <joel.stan@gmail.com>
Received: from mail-qk0-x22c.google.com (mail-qk0-x22c.google.com
 [IPv6:2607:f8b0:400d:c09::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rGML02r6jzDqXp
 for <openbmc@lists.ozlabs.org>; Fri, 27 May 2016 20:13:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=q7H0l50b; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=OcRG6vh9; 
 dkim-atps=neutral
Received: by mail-qk0-x22c.google.com with SMTP id n63so76153265qkf.0
 for <openbmc@lists.ozlabs.org>; Fri, 27 May 2016 03:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=RiyrJATdWRYs9lqsmai1p01cna5FiHm3wLjW6LxFaXU=;
 b=q7H0l50bNFosTcwje381ewWLXW1Qxe9KkErFgGQvtjBw/NEAEpxG5fpcmWtvCsEtrd
 yhhBZc41k/zeWgIt+P7X0WOwcwkRvspm8/AVKSYA4sFuW8xJpXzeKQJU2s/G4G8DZr9b
 JE1XQ1pupbrmOCl5zh7rE/WbWt4rIj4Z+2x1zZxH/2p2kN6VHAwlbZFQR/af6IDFbSTH
 NvS5wG8XH5/ZK3ioixyRrzevVb3FTrUUG99jKbLOWc6ZHIvI2t//jsFIobrUtIEPegaK
 yYACU18BZtrfkFcxSmfSkqQmso8UrngeY4W11b+6J8k8rWIXSR2+yOr7gtC5DdPoUq3M
 4iLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=RiyrJATdWRYs9lqsmai1p01cna5FiHm3wLjW6LxFaXU=;
 b=OcRG6vh9yhp4Vl4ojyxM1lnXx9jTUUaGol/YqmwqJwbHZbr59t9BaVvuLXdsKHt4Bp
 fK7ukLVtY+nsMxdateWhG8iEtEp+BhbWUseCmBhX8FHtdWJrjCueQ+3IjitrWhxMWg9d
 HSEWQ66PsoetRXoEN4IyXwZ1YeGX03/lbCprE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=RiyrJATdWRYs9lqsmai1p01cna5FiHm3wLjW6LxFaXU=;
 b=RpxXj5+aOgh2ppviR+85xXc+bX7qsI/cAsI+ef60mF+b917A8Z0hGmwKAeq9XsVgwd
 yMgytu2HwVTqWcLBL5Z7JjrMqDYv6I8Jxkt6tjsTiLzRv8cwxMt05yfEoez/QO/B0LSy
 zL/74fbEJOhWxT32YbbMLD/Q5CkIHz/CaJ4CgjLpIQcimrWMRSwMijqH5eGpUNhMUr/x
 LoAY+bM46iFV9DYEVk6I3R9tBCDhTF7dYAVGPdOO/qO5+DujahCfLM3YIrgrgcwHzGHZ
 A6kl78Ee4a9BtUNN9RyL7xVUWvIWuhwMlcZhFE4Ft1uPnEIJi6gZn9LxiXYQW+33gqO+
 gZ/A==
X-Gm-Message-State: ALyK8tK7Jb5/8hVbTB/G9W6JQIJjsXQxoSAOeXMe6i2tnEs8f3zzCA5C1VutDyBUegoaU9xt7ZJQcdAnitkREg==
X-Received: by 10.55.203.132 with SMTP id u4mr12869059qkl.12.1464344021726;
 Fri, 27 May 2016 03:13:41 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.44.196 with HTTP; Fri, 27 May 2016 03:13:22 -0700 (PDT)
In-Reply-To: <57480C2F.4090902@kaod.org>
References: <57480C2F.4090902@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 27 May 2016 19:43:22 +0930
X-Google-Sender-Auth: URTFm1Q-6F-Xh35Tjf58grxvzcc
Message-ID: <CACPK8Xe6Cu-7+1bKd3DaNcGbv4+BhW_nziA=TVgU8A6STRGzDg@mail.gmail.com>
Subject: Re: updating u-boot_2013.07.bb recipe
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Milton D. Miller II" <miltonm@us.ibm.com>, 
 Patrick Williams <patrick@stwcx.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Fri, 27 May 2016 10:13:46 -0000

Hey Cedric,

On Fri, May 27, 2016 at 6:28 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> The uboot recipe in openbmc is still at 4b44678c11. Without them, I see
> memory corruption under qemu, so I suppose this is the same for real HW.
>
> commit 6f7818cdb8d8 "net: aspeednic: Do not start hardware in initialize"
> seems to solve the problem.
>
> Is there a reason for staying at that level in uboot ? Could we take all
> Milton's patches in ?

We updated to 44f1262bdf39ad93032d39f17a298165372be82e just yesterday:

 https://github.com/openbmc/openbmc/commit/265b0d55113d364554102d5321779167=
41c8c379

The hold up related to some discussion around not going back to the
default compiler:

 https://github.com/openbmc/openbmc/pull/227

I see Patrick closed this yesterday. I'm not sure what the plans are
there; I would strongly recommend we go back to the more modern
compiler.

Cheers,

Joel
