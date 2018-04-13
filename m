Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::232; helo=mail-ua0-x232.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="LN5okgH6"; 
 dkim-atps=neutral
Received: from mail-ua0-x232.google.com (mail-ua0-x232.google.com
 [IPv6:2607:f8b0:400c:c08::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40N7LH0hDLzF1SH
 for <openbmc@lists.ozlabs.org>; Sat, 14 Apr 2018 05:36:05 +1000 (AEST)
Received: by mail-ua0-x232.google.com with SMTP id u4so6477760uaf.10
 for <openbmc@lists.ozlabs.org>; Fri, 13 Apr 2018 12:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NA63mbbfqXeyYH5qGJuCArKkwFYRJixMyDTZJvF/LmM=;
 b=LN5okgH6dYle674k0kVAJHHlSxXb867RjL80BwKaOas2phWsZktSXzsAH0EIrJ5Ho6
 HV2vpYcyfM5MAVgKJ78SvcBBltFLecxdSxUZtdpMZ3jyQEfsTDgnehWDqOU3qACOSmjG
 3wG4HWotAgyMMgwnN9fRrulqhw9ENudvEYkRcvxQXLPzkqURa27Lzc6KfW/sYxib+X9p
 ZBqkpLbVxLupwTNU/oIR/+R0Bk28ToOlfgYkTndk6+O9GUBJXlUzDZQ+yGCIC7mss5H+
 oakIPDe8Kms190vENgLo3CdO7S9r1OA4Y/JV8jsR2JC86GDuz1ztclrw7Ma9HWdeKCzU
 eY8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NA63mbbfqXeyYH5qGJuCArKkwFYRJixMyDTZJvF/LmM=;
 b=nLg6yTFMzs/zR06+YByfOEhHZic1eH25UDOYQN+2sv6C2zIhjxYcQJSwgmnkhIUuBB
 EShFMxrU/TcN4YwpA040saaU21eOk2wmqU64Ig2OGL0nfnNpY/N9kdYhPzUotSzXjLRj
 ITQnmWpx62M6JganMNQpmQ8zNkI5u+d/XJ0EzD6YdwFi2AjmA4/AsbrEzLAXsF/aqtyu
 mqZnyujxkI40WYdgMILPPx1rbEisGAXKnCp7DJc++pZ+NwBzdY9EXDq3Ka314a4dZSmC
 9+IaGJOYJ18FlhkLnc7T9tk6umMcYicVd1cyX9r+BHi2JoGr+4z+msWtRChBKe177tUd
 4L6A==
X-Gm-Message-State: ALQs6tCoIq8iiFG7bt6M9tBdMnCVup83+LC5bi31U8xNydgwDJlR489n
 JgiQdlzwz3oKD6gf264jBHHoPA17GRkqC9geuB8eWg==
X-Google-Smtp-Source: AIpwx48QpIG2X6b7B+6KpXb9Vjv3EeCd1jOcBdbxPwecARwYTPrOtxGjAiCTU1DCifYtrSiQGrYkXswQWPQKaQxQGwc=
X-Received: by 10.159.59.214 with SMTP id y22mr4908401uah.142.1523648163184;
 Fri, 13 Apr 2018 12:36:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.124.193 with HTTP; Fri, 13 Apr 2018 12:35:42 -0700 (PDT)
In-Reply-To: <CADfYTpG+ceGDtcvW7zVkmVAMehcnchrOpJcJtUjFWF7P=-W0cw@mail.gmail.com>
References: <6BB03E30-7768-4455-BB7D-6B1C8AECBDE4@gmail.com>
 <1523367363.1598830.1332941912.403D2457@webmail.messagingengine.com>
 <2D4C2F3F-7B13-48C4-9E4C-5733835552F9@gmail.com>
 <CADfYTpG+ceGDtcvW7zVkmVAMehcnchrOpJcJtUjFWF7P=-W0cw@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 13 Apr 2018 12:35:42 -0700
Message-ID: <CAO=notymMJ=Qh9qm2UFAEAemwYH=0e5kGUrQGBQzMqkR2eqtGA@mail.gmail.com>
Subject: Re: How to power on Intel x86 based CPUs
To: Nancy Yuen <yuenn@google.com>
Cc: Brad Chou <chou.brad@gmail.com>, Andrew Jeffery <andrew@aj.id.au>, 
 Ed Tanous <ed.tanous@intel.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Fri, 13 Apr 2018 19:36:07 -0000

On Fri, Apr 13, 2018 at 10:53 AM, Nancy Yuen <yuenn@google.com> wrote:
> Patrick Venture uses the q71l and may be able to answer #2.  I suspect it
> was removed simply b/c the system we were using it on didn't use it.
>
> ----------
> Nancy
>
> On Fri, Apr 13, 2018 at 2:43 AM, Brad Chou <chou.brad@gmail.com> wrote:
>>
>> Hi,
>> Actually I am using the meta-s2600wf as my TEMPLATECONF.
>> Now switch to Q71L but found some problems :
>>
>> 1. I can not send the same REST command to power up the host. It seems t=
he
>> xyz/openbmc_project/state/host0/attr/RequestedHostTransition
>> is gone. I even can=E2=80=99t see any attributes related to
>> xyz/openbmc_project/state.
>>
>> 2. I found in quanta-q71l.conf, it remove the obmc-host-state-mgmt, this
>> may be needed when using REST to power on host. Why q71L remove it ?  Is=
 it
>> because of not compatible with x86 system ?

We didn't require it.  There was nothing wired up to it for us.  One
could conceivably wire up the power-on script stuff.

>>
>> 3. Suppose the REST is not used by Q71L, how can I power it up from LAN =
?
>>
>> Thanks.
>>
>>
>> On Apr 10, 2018, at 21:36, Andrew Jeffery <andrew@aj.id.au> wrote:
>>
>> Hi Brad,
>>
>> On Tue, 10 Apr 2018, at 19:35, Brad Chou wrote:
>>
>> Hi,
>> I am going to power on my OEM server board with two Intel x86 CPUs. The
>> BMC chip is ASPEED 2500.
>>
>> By the Intel data sheets, I just need to control a power on GPIO to
>> emulate power button behavior.
>> The problems are, when I send Host State Control commands as mentioned
>> in docs/host-management.md, the journal log shows a lot of systemctl
>> errors.
>>
>> Looks like it is going to start the OpenPower related host control
>> services, which only applies to PowerPC system.
>> I try to modify GPIO_CONFIGS appears in skeleton recipe to match my
>> board, but I still got some other errors says pflash stuffs.
>>
>>
>> It sounds like you're building an OpenPOWER-based BMC image - this is
>> controlled by how you set the TEMPLATECONF environment variable when
>> sourcing the `openbmc-env` file to build (at a guess I'd say you're buil=
ding
>> for Palmetto, as it's used throughout the examples in the docs repo).
>>
>> We do have support for a couple of x86 machines in the tree - your best
>> bet is probably the Quanta 71L machine maintained by Patrick Venture:
>>
>>
>> https://github.com/openbmc/openbmc/tree/master/meta-openbmc-machines/met=
a-x86/meta-quanta/meta-q71l
>>
>> As an aside, if you're experimenting and switching between target
>> machines, it's probably a good idea to blow away your build/conf directo=
ry
>> to make sure things get set up correctly when you next set TEMPLATECONF =
and
>> source openbmc-env.
>>
>>
>> Because there is no documents to tell me how to customize the openbmc to
>> fit on x86 CPUs, so I am not sure the GPIO_CONFIGS in skeleton is the
>> right way or not.
>>
>>
>> Yeah, there's not a wealth of documentation on bringing up a new machine=
.
>> It would be great if you could document your experience once you get the=
re
>> :)
>>
>> Hope that helps in some way,
>>
>> Andrew
>>
>>
>
