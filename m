Return-Path: <xavinux@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::231; helo=mail-qt0-x231.google.com;
 envelope-from=xavinux@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="TJtJdJnO"; 
 dkim-atps=neutral
Received: from mail-qt0-x231.google.com (mail-qt0-x231.google.com
 [IPv6:2607:f8b0:400d:c0d::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yD8Y90bxhzDqlv
 for <openbmc@lists.ozlabs.org>; Sat, 14 Oct 2017 01:02:20 +1100 (AEDT)
Received: by mail-qt0-x231.google.com with SMTP id j58so8636846qtj.0
 for <openbmc@lists.ozlabs.org>; Fri, 13 Oct 2017 07:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=eKrHZ5PnwIWDAQRYBB4NDTZnx2hTPeuy6CfHC1JAjpM=;
 b=TJtJdJnOPOReb9ak9kPB7+k82sFvX9vv1j1Xo34HZklx5l6cRK89RsFRJfMmL9YE5n
 M4f9//eJdRYiPC8cXiqGFjynB0PQUlyScl4JYSJEiNClpsiEBmkiUEsH2yhYw4HShCC4
 L2V26EPSn0ye82QsUZ0ujPhWsAzKlMVoUte+e+0+m9lgZMgpJtyCi+NHtiwAuSzTq0wz
 0sy+S4hdCldEr0s+Ua7mKIPW7yJyiaYcRs496cZH9fzlL9zCjP5+oDjhbC3eTp37yPYv
 WikFl3cNszcHGGx+eGnQubQzasBRs2uSovQXFZM1bZN4ctV6xicB9nsBFu6FcEgFVqlS
 Bc5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=eKrHZ5PnwIWDAQRYBB4NDTZnx2hTPeuy6CfHC1JAjpM=;
 b=TuKlDw48nfTRdVNDJ6XRD0AmHrRVSo5OqLau3aD1xguGI5cmuau9zYrxI1IK3TiNM1
 stmeAQl3IFbvI4vXaux4MwSNTUKgpytk6un/4AGKdR+jNzXNDhIuZLFe/VV1B1/wESt9
 2A94jYq0A5wfXCZMC99iE0WJdWtcP4vOAhXZBgG6AXp9d3g1tP+iU18NzP+rsAI5HfxW
 PSiIgsMWFA/Efidwvi3RevU9O6n9pP18OImM585DPsRpmSrlBwUyx+VDpXFJVGW79jkx
 KwWBhUGb85RRjKnzgueDDqCimc97HjqEhJwIfsENPNHcsBaPaxAhx3APlOBBF1KcoYV8
 RWJw==
X-Gm-Message-State: AMCzsaVtBaGA3V+Hya5dCF+3JybiQrCf8OPt7M+n4Es737No8SGmj5Pt
 tIT31IdcNaB1E72PFX201iIB78SNj3Kr6eTUrEk=
X-Google-Smtp-Source: AOwi7QBuZOG/30WS/BluxlKfgBwVPkx0SRbGMOOI8xjfRlIxARdXrRk49ESPRmj8+h88kWFYsdcop2X4E0TpgZ872d4=
X-Received: by 10.200.0.135 with SMTP id c7mr2248192qtg.66.1507903337770; Fri,
 13 Oct 2017 07:02:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.153.200 with HTTP; Fri, 13 Oct 2017 07:02:17 -0700 (PDT)
In-Reply-To: <1507870562.5452.195.camel@aj.id.au>
References: <CAEX+82Lr=pJEvRqfi9MA=ZBW=DR+mY2VYVUhhTBgrPFA3c239g@mail.gmail.com>
 <CAPLgG=nHvmVzBW2CDxvgaeYAHoNL53W3An-p9fK3D4HfsU=Bbw@mail.gmail.com>
 <1507325323.1545468.1130544088.6FEEF44B@webmail.messagingengine.com>
 <CAEX+82KLmByCXqVg1Hzi7r5-cH2=Cx-0OE_hLwx-Jr_XXfe1Wg@mail.gmail.com>
 <CAEX+82Ls_e7EdupoUUbWEOL5gngd5BdxAY6YptHqAVp7HuJvjA@mail.gmail.com>
 <1507466681.5452.143.camel@aj.id.au>
 <CAEX+82+KQAV5WMuWh1VZCL+zb7TXXnxeUS_=8nQk1tC=8jrtqg@mail.gmail.com>
 <1507531274.5452.154.camel@aj.id.au>
 <OF72E5748D.A94F82AF-ON482581B4.0033C44D-482581B4.003504C9@notes.na.collabserv.com>
 <CAEX+82LFjvc4=Ai6p4k66EBfE-45jrYUwvmPFGdgSb4OdzQVFA@mail.gmail.com>
 <1507594463.5452.156.camel@aj.id.au>
 <CAEX+82+j8xq5JikSPWi_ycwnoQLNUF1YVUVjxsSdtBfG3b2-Ug@mail.gmail.com>
 <1507691159.5452.168.camel@aj.id.au>
 <CAEX+82KL+N5VCvo+LH20=1paTZvKo2M7PqdXk7=bFq7MdAGeSA@mail.gmail.com>
 <1507870562.5452.195.camel@aj.id.au>
From: Javier Romero <xavinux@gmail.com>
Date: Fri, 13 Oct 2017 11:02:17 -0300
Message-ID: <CAEX+82L4mdooB_j6asHYdKmr=FRM1NuZJX3dVy2W+7fZpJb2vw@mail.gmail.com>
Subject: Re: OpenBMC on Raspberry PI 3.
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Yi TZ Li <shliyi@cn.ibm.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Oct 2017 14:02:21 -0000

> Ah I wasn't talking about anything in particular, just that we should
> be able to improve our documentation from the questions you ask as you
> try to get OpenBMC working on the Raspberry Pi

So, will have to wait till the bug I've reported is fixed to continue
working with OpenBMC on Raspberry, nothing else I can do with my RPI
and obmc?

> But regarding the documentation, have you read through the docs repository at all?

Yes, I have check the documentation.

Javier Romero
E-mail: xavinux@gmail.com
Skype: xavinux



2017-10-13 1:56 GMT-03:00 Andrew Jeffery <andrew@aj.id.au>:
> On Wed, 2017-10-11 at 16:09 -0300, Javier Romero wrote:
>> > Great! I look forward to you helping us improve our documentation and
>> > on-boarding of contributors. It might be rocky but it should help those
>> > coming along in the future.
>>
>> A starting point to start my contribution, so, how can I help on this?
>
> Ah I wasn't talking about anything in particular, just that we should
> be able to improve our documentation from the questions you ask as you
> try to get OpenBMC working on the Raspberry Pi. But regarding the
> documentation, have you read through the docs repository at all?
> Contributions are certainly welcome there:
>
> https://github.com/openbmc/docs/
>
> Cheers,
>
> Andrew
