Return-Path: <teddy.reed@gmail.com>
Received: from mail-wm0-x244.google.com (mail-wm0-x244.google.com
 [IPv6:2a00:1450:400c:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rNMLP0JZrzDq64
 for <openbmc@lists.ozlabs.org>; Mon,  6 Jun 2016 14:34:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=tUGDfuD2; 
 dkim-atps=neutral
Received: by mail-wm0-x244.google.com with SMTP id n184so13311431wmn.1
 for <openbmc@lists.ozlabs.org>; Sun, 05 Jun 2016 21:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=aDHj/eybphPUWuA2s5BdrK392H/G5QkjAVyV0g335gg=;
 b=tUGDfuD2N4e2dcu9nk2auxHdYEiYgtDXApKxGErGGdTeJgpMHkgpnPO5IAKpZ7yv5k
 UayXeaHtRBxyY1M4M2t/Y7h6QDo8gvfuqerDJXWk+d5hY1JEwYqZAuNngvMXejdPcYP8
 g53lbSZAhM5wxFFW0ccMZ5iuN/EhZnrnECVwsBZjiH4TBB8Vz3uYeNtM7XIxpEU4ieA7
 Cv5QRYPM98GU67vbto9iCyP8jETwrCe1PdDPbNMzsoN8CyuWxA+2YgzeK+DstgSliUaA
 9w5eeUIKULXddqXHAnbZWv+p/RS6QjytldNCr0dZme2u3Vxgf9GZ424wN9Yj5XDa26xq
 Z52g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=aDHj/eybphPUWuA2s5BdrK392H/G5QkjAVyV0g335gg=;
 b=fxN+dXdMAvIepiEAPRTanFl92HaEJVSgd+v8GcAMdLcj6ORz+agBTBK1HRLMyGPt8U
 J75ylO25IMFa+mlpwXwTpDL6kXsSuvdATAe62nIhZONOy94Fi/oKxdpgnSugD8gXtryK
 8S6OQADqMTT9rap3VatQY2oz53BfnJxXCviJhZrhov2SV/LlMMM/dU8Snoa9PUL5wv0G
 woSPrMk/pXnvMhAL+WiORvDa/3oP+FZlz+RJxQ2RAu4nBSutdAfn1ZOoArTMyf93nK65
 Q+GGspiH+GUYyUMHKKQfoZU3lxL/hJoztiy0oXllakPJEzeIiOsvASVnUdvtty6UZI8/
 AWHw==
X-Gm-Message-State: ALyK8tKbbesBFqJDm74tDWnfw/URvaOW38WsDMaFbdID6eubeyghNwu8LMA+TycP9WJ/+Q==
X-Received: by 10.28.43.129 with SMTP id r123mr9041494wmr.99.1465187689624;
 Sun, 05 Jun 2016 21:34:49 -0700 (PDT)
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com.
 [74.125.82.41])
 by smtp.gmail.com with ESMTPSA id c185sm12082462wme.9.2016.06.05.21.34.49
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 05 Jun 2016 21:34:49 -0700 (PDT)
Received: by mail-wm0-f41.google.com with SMTP id m124so55356380wme.1
 for <openbmc@lists.ozlabs.org>; Sun, 05 Jun 2016 21:34:49 -0700 (PDT)
X-Received: by 10.28.168.71 with SMTP id r68mr9201360wme.44.1465187688854;
 Sun, 05 Jun 2016 21:34:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.122.41 with HTTP; Sun, 5 Jun 2016 21:34:48 -0700 (PDT)
X-Originating-IP: [24.6.55.56]
In-Reply-To: <1465180621.16048.16.camel@aj.id.au>
References: <20160605153723.261560bea9e9e70d3469d475@gmail.com>
 <CACPK8Xc+YSYpSZifuTUoK7=zTbHYMmAhaNkwnAbr1S=E-d59-g@mail.gmail.com>
 <CADUykerRi6FuovZEDOE1kg83kXSHPCZF1Jv7CekGjQVJnWbx5A@mail.gmail.com>
 <1465180621.16048.16.camel@aj.id.au>
From: Teddy Reed <teddy.reed@gmail.com>
Date: Sun, 5 Jun 2016 21:34:48 -0700
X-Gmail-Original-Message-ID: <CADUykepBJM4yGDuWLJSOtp0C0PfYOnihAO4BZd_BjGD-YyYf5w@mail.gmail.com>
Message-ID: <CADUykepBJM4yGDuWLJSOtp0C0PfYOnihAO4BZd_BjGD-YyYf5w@mail.gmail.com>
Subject: Re: [PATCH qemu] Add OpenCompute Yosemite BMC ARM board
To: Andrew Jeffery <andrew@aj.id.au>
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
X-List-Received-Date: Mon, 06 Jun 2016 04:34:54 -0000

On Sun, Jun 5, 2016 at 7:37 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Hi Teddy,
>
> On Sun, 2016-06-05 at 19:11 -0700, Teddy Reed wrote:
>> On Sun, Jun 5, 2016 at 4:26 PM, Joel Stanley <joel@jms.id.au> wrote:
>> > Hey Teddy,
>> >
>> > On Sun, Jun 5, 2016 at 5:37 PM, Teddy Reed <teddy.reed@gmail.com> wrote:
>> >> The Yosemite BMC board is very similar to the Palmetto BMC. They both configure
>> >> an AST2400 SoC and have rather simple device sets.
>> >
>> > Nice!
>> >
>> > Are you planning on sending this upstream?
>>
>> Yeah! I'm not sure if the IBM team plans to push the QEMU changes in
>> the OpenBMC fork upstream en masse, if not I can also send a similar
>> patch once we work through a few revisions here.
>
> My preference is that patch authors send their own work upstream, at
> least for the moment. I'll aim to be a maintainer in upstream for the
> Aspeed bits, but I'm not across what hoops I'll need to jump through
> for that, and until then it's probably best that everyone submits their
> own patches.

Excellent, sounds like a plan!

-- 
Teddy Reed V
