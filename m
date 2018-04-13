Return-Path: <chou.brad@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c05::235; helo=mail-pg0-x235.google.com;
 envelope-from=chou.brad@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="MaFuX8ej"; 
 dkim-atps=neutral
Received: from mail-pg0-x235.google.com (mail-pg0-x235.google.com
 [IPv6:2607:f8b0:400e:c05::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40MtBq1m7KzF1qc
 for <openbmc@lists.ozlabs.org>; Fri, 13 Apr 2018 19:43:46 +1000 (AEST)
Received: by mail-pg0-x235.google.com with SMTP id e12so1698810pgn.9
 for <openbmc@lists.ozlabs.org>; Fri, 13 Apr 2018 02:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:mime-version:subject:date:references:to:in-reply-to:message-id;
 bh=7t5av7jERM5D6sZwOSLjUue1btcYisLZWPsTzumXMI4=;
 b=MaFuX8ejj/9KU+zQYP6/fg5HlQOEv9kLjhhJgS5quj3rGmgmo0C/ojvIf1R2ToiGOs
 qNw5hj2yp2HNtU2z6+qfTYWgFiPAczm+0pBzRaJjMqceae2i42xR7nKmY198Yd7PnVP5
 1pRDds2m8lm34shy+wqrwmmEgeG5DJI1TmMhBRRNcYtPNo4RfHpHR81hEZCTISOPyIwz
 C7S6hO1Elojm9xC9WdKWmgG6i6nrqYz3jzCw+T/OfuT65oElen/8ygp5tALXx0+JZEew
 8aCJ4ZS11yHR+GfCS9vUskDS8nPwMZU+uVhwaM5/tuspvmiu9l5sHipTacyk9VmTmnTS
 0ABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:mime-version:subject:date:references:to
 :in-reply-to:message-id;
 bh=7t5av7jERM5D6sZwOSLjUue1btcYisLZWPsTzumXMI4=;
 b=stU3tBx4AR34vniZW1+woK5thxVT244qxht4YGyFDbZczvuAZFxfM08OUBCjd3qfHB
 Zu26pC255olB4eLah7PS3lQEfBDHfyj3pd485p1hgpCyARGRmVJp8Hc8Q42oHnsl8l99
 y2HtcQTvkVY+qAI1E1pdg1NctSZJP7T7W4YRAg/4+/FDYwgsB1oM1X45xaVskLlNUpZ+
 5EKlEEG07RILn7TpkU6Dl0t+pHZrE2PeAiYJukPVYCTJM55Qh/13sCMpu9brt9/zKZ14
 qKx0LYpAICA1t6HXpo0v/ud9KJ6VGNk1OU5qtuOpPjiGddzse4sBdXbWbnLYjISnClMo
 1vdg==
X-Gm-Message-State: ALQs6tAGkEzJev4xAPwa7PU5QBOXnGZxTcVgSaSb/o4l+r4JFPgDPuT8
 twvK2SRMq5n1CwUsLZSR0jOkz9O5
X-Google-Smtp-Source: AIpwx48ZzZUFVa1acB3BxX8JVKBeGA+3fuml9gvkTqVmqRSiLGiN5x2pXJCxOYBS9rRC6SpDxgYiPA==
X-Received: by 10.99.116.17 with SMTP id p17mr3586707pgc.43.1523612624847;
 Fri, 13 Apr 2018 02:43:44 -0700 (PDT)
Received: from [192.168.1.2] (118-163-39-90.HINET-IP.hinet.net.
 [118.163.39.90])
 by smtp.gmail.com with ESMTPSA id f19sm8594010pgv.39.2018.04.13.02.43.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 13 Apr 2018 02:43:43 -0700 (PDT)
From: Brad Chou <chou.brad@gmail.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_42364155-0AAD-443C-B128-D93C9C114437"
Mime-Version: 1.0 (Mac OS X Mail 11.3 \(3445.6.18\))
Subject: Re: How to power on Intel x86 based CPUs
Date: Fri, 13 Apr 2018 17:43:40 +0800
References: <6BB03E30-7768-4455-BB7D-6B1C8AECBDE4@gmail.com>
 <1523367363.1598830.1332941912.403D2457@webmail.messagingengine.com>
To: Andrew Jeffery <andrew@aj.id.au>, Ed Tanous <ed.tanous@intel.com>,
 openbmc@lists.ozlabs.org
In-Reply-To: <1523367363.1598830.1332941912.403D2457@webmail.messagingengine.com>
Message-Id: <2D4C2F3F-7B13-48C4-9E4C-5733835552F9@gmail.com>
X-Mailer: Apple Mail (2.3445.6.18)
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
X-List-Received-Date: Fri, 13 Apr 2018 09:43:50 -0000


--Apple-Mail=_42364155-0AAD-443C-B128-D93C9C114437
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi,
Actually I am using the meta-s2600wf as my TEMPLATECONF.
Now switch to Q71L but found some problems :

1. I can not send the same REST command to power up the host. It seems =
the xyz/openbmc_project/state/host0/attr/RequestedHostTransition=20
is gone. I even can=E2=80=99t see any attributes related to =
xyz/openbmc_project/state.

2. I found in quanta-q71l.conf, it remove the obmc-host-state-mgmt, this =
may be needed when using REST to power on host. Why q71L remove it ?  Is =
it because of not compatible with x86 system ?

3. Suppose the REST is not used by Q71L, how can I power it up from LAN =
?

Thanks.


> On Apr 10, 2018, at 21:36, Andrew Jeffery <andrew@aj.id.au> wrote:
>=20
> Hi Brad,
>=20
> On Tue, 10 Apr 2018, at 19:35, Brad Chou wrote:
>> Hi,
>> I am going to power on my OEM server board with two Intel x86 CPUs. =
The=20
>> BMC chip is ASPEED 2500.
>>=20
>> By the Intel data sheets, I just need to control a power on GPIO to=20=

>> emulate power button behavior.
>> The problems are, when I send Host State Control commands as =
mentioned=20
>> in docs/host-management.md, the journal log shows a lot of systemctl=20=

>> errors.
>>=20
>> Looks like it is going to start the OpenPower related host control=20
>> services, which only applies to PowerPC system.
>> I try to modify GPIO_CONFIGS appears in skeleton recipe to match my=20=

>> board, but I still got some other errors says pflash stuffs.
>=20
> It sounds like you're building an OpenPOWER-based BMC image - this is =
controlled by how you set the TEMPLATECONF environment variable when =
sourcing the `openbmc-env` file to build (at a guess I'd say you're =
building for Palmetto, as it's used throughout the examples in the docs =
repo).
>=20
> We do have support for a couple of x86 machines in the tree - your =
best bet is probably the Quanta 71L machine maintained by Patrick =
Venture:
>=20
> =
https://github.com/openbmc/openbmc/tree/master/meta-openbmc-machines/meta-=
x86/meta-quanta/meta-q71l
>=20
> As an aside, if you're experimenting and switching between target =
machines, it's probably a good idea to blow away your build/conf =
directory to make sure things get set up correctly when you next set =
TEMPLATECONF and source openbmc-env.
>=20
>>=20
>> Because there is no documents to tell me how to customize the openbmc =
to=20
>> fit on x86 CPUs, so I am not sure the GPIO_CONFIGS in skeleton is the=20=

>> right way or not.
>=20
> Yeah, there's not a wealth of documentation on bringing up a new =
machine. It would be great if you could document your experience once =
you get there :)
>=20
> Hope that helps in some way,
>=20
> Andrew


--Apple-Mail=_42364155-0AAD-443C-B128-D93C9C114437
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D"">Hi,<div class=3D""><div class=3D"">Actually I am using the =
meta-s2600wf as my TEMPLATECONF.</div><div class=3D"">Now switch to Q71L =
but found some problems :</div><div class=3D""><br class=3D""></div><div =
class=3D"">1. I can not send the same REST command to power up the host. =
It seems the&nbsp;<span style=3D"font-family: SFMono-Regular, Consolas, =
&quot;Liberation Mono&quot;, Menlo, Courier, monospace; caret-color: =
rgb(36, 41, 46); color: rgb(36, 41, 46); font-size: =
13.600000381469727px;" =
class=3D"">xyz/openbmc_project/state/host0/attr/RequestedHostTransition&nb=
sp;</span></div><div class=3D"">is gone. I even can=E2=80=99t see any =
attributes related to&nbsp;<span style=3D"caret-color: rgb(36, 41, 46); =
color: rgb(36, 41, 46); font-family: SFMono-Regular, Consolas, =
&quot;Liberation Mono&quot;, Menlo, Courier, monospace; font-size: =
13.600000381469727px;" =
class=3D"">xyz/openbmc_project/state.</span></div><div class=3D""><span =
style=3D"caret-color: rgb(36, 41, 46); color: rgb(36, 41, 46); =
font-family: SFMono-Regular, Consolas, &quot;Liberation Mono&quot;, =
Menlo, Courier, monospace; font-size: 13.600000381469727px;" =
class=3D""><br class=3D""></span></div><div class=3D""><font =
color=3D"#24292e" face=3D"SFMono-Regular, Consolas, Liberation Mono, =
Menlo, Courier, monospace" size=3D"2" class=3D""><span =
style=3D"caret-color: rgb(36, 41, 46);" class=3D"">2. I found =
in&nbsp;quanta-q71l.conf, it remove the obmc-host-state-mgmt, this may =
be needed when using REST to power on host. Why q71L remove it ? =
&nbsp;Is it because of not compatible with x86 system =
?</span></font></div><div class=3D""><font color=3D"#24292e" =
face=3D"SFMono-Regular, Consolas, Liberation Mono, Menlo, Courier, =
monospace" size=3D"2" class=3D""><span style=3D"caret-color: rgb(36, 41, =
46);" class=3D""><br class=3D""></span></font></div><div class=3D""><font =
color=3D"#24292e" face=3D"SFMono-Regular, Consolas, Liberation Mono, =
Menlo, Courier, monospace" size=3D"2" class=3D""><span =
style=3D"caret-color: rgb(36, 41, 46);" class=3D"">3. Suppose the REST =
is not used by Q71L, how can I power it up from LAN =
?</span></font></div><div class=3D""><br class=3D""></div><div =
class=3D""><font color=3D"#24292e" face=3D"SFMono-Regular, Consolas, =
Liberation Mono, Menlo, Courier, monospace" size=3D"2" class=3D""><span =
style=3D"caret-color: rgb(36, 41, 46);" =
class=3D"">Thanks.</span></font></div><div class=3D""><font =
color=3D"#24292e" face=3D"SFMono-Regular, Consolas, Liberation Mono, =
Menlo, Courier, monospace" size=3D"2" class=3D""><span =
style=3D"caret-color: rgb(36, 41, 46);" class=3D""><br =
class=3D""></span></font></div><div class=3D""><div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">On Apr =
10, 2018, at 21:36, Andrew Jeffery &lt;<a href=3D"mailto:andrew@aj.id.au" =
class=3D"">andrew@aj.id.au</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">Hi =
Brad,<br class=3D""><br class=3D"">On Tue, 10 Apr 2018, at 19:35, Brad =
Chou wrote:<br class=3D""><blockquote type=3D"cite" class=3D"">Hi,<br =
class=3D"">I am going to power on my OEM server board with two Intel x86 =
CPUs. The <br class=3D"">BMC chip is ASPEED 2500.<br class=3D""><br =
class=3D"">By the Intel data sheets, I just need to control a power on =
GPIO to <br class=3D"">emulate power button behavior.<br class=3D"">The =
problems are, when I send Host State Control commands as mentioned <br =
class=3D"">in docs/host-management.md, the journal log shows a lot of =
systemctl <br class=3D"">errors.<br class=3D""><br class=3D"">Looks like =
it is going to start the OpenPower related host control <br =
class=3D"">services, which only applies to PowerPC system.<br class=3D"">I=
 try to modify GPIO_CONFIGS appears in skeleton recipe to match my <br =
class=3D"">board, but I still got some other errors says pflash =
stuffs.<br class=3D""></blockquote><br class=3D"">It sounds like you're =
building an OpenPOWER-based BMC image - this is controlled by how you =
set the TEMPLATECONF environment variable when sourcing the =
`openbmc-env` file to build (at a guess I'd say you're building for =
Palmetto, as it's used throughout the examples in the docs repo).<br =
class=3D""><br class=3D"">We do have support for a couple of x86 =
machines in the tree - your best bet is probably the Quanta 71L machine =
maintained by Patrick Venture:<br class=3D""><br class=3D""><a =
href=3D"https://github.com/openbmc/openbmc/tree/master/meta-openbmc-machin=
es/meta-x86/meta-quanta/meta-q71l" =
class=3D"">https://github.com/openbmc/openbmc/tree/master/meta-openbmc-mac=
hines/meta-x86/meta-quanta/meta-q71l</a><br class=3D""><br class=3D"">As =
an aside, if you're experimenting and switching between target machines, =
it's probably a good idea to blow away your build/conf directory to make =
sure things get set up correctly when you next set TEMPLATECONF and =
source openbmc-env.<br class=3D""><br class=3D""><blockquote type=3D"cite"=
 class=3D""><br class=3D"">Because there is no documents to tell me how =
to customize the openbmc to <br class=3D"">fit on x86 CPUs, so I am not =
sure the GPIO_CONFIGS in skeleton is the <br class=3D"">right way or =
not.<br class=3D""></blockquote><br class=3D"">Yeah, there's not a =
wealth of documentation on bringing up a new machine. It would be great =
if you could document your experience once you get there :)<br =
class=3D""><br class=3D"">Hope that helps in some way,<br class=3D""><br =
class=3D"">Andrew<br class=3D""></div></div></blockquote></div><br =
class=3D""></div></div></body></html>=

--Apple-Mail=_42364155-0AAD-443C-B128-D93C9C114437--
