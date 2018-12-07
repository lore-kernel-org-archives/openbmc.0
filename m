Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::832; helo=mail-qt1-x832.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="nJkipo/E"; 
 dkim-atps=neutral
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43BM7G0qp2zDr7m
 for <openbmc@lists.ozlabs.org>; Sat,  8 Dec 2018 05:53:29 +1100 (AEDT)
Received: by mail-qt1-x832.google.com with SMTP id y20so5566925qtm.13
 for <openbmc@lists.ozlabs.org>; Fri, 07 Dec 2018 10:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kEmX/dhM7oGPxhjVmWlpUUsQZJsYHpeqYIWck3Kbyg4=;
 b=nJkipo/ElqDMa3ODVMeIyZffAmMXT8Uu0OZH+hSrZFJGLS2sPicr0Bnj11181uneIw
 +7Ss5tfjTvZmOXHHYy3DM+gRygGQ5GchgA5xWzAtFrc6nMi8UqJsQItspmA/0mDg8hl9
 UttREpU7eGh61QbILzZG/uAvTUGVhfOEvrCUFO1h/qH+PQIxnr2qzwF9Zdf4AYv9tl0K
 zEScIs3uWbDg3zraPM41ayF4GaxnR67ldV29Ox1IcNMMDQYgr9yLd6UfQf7nSFZbTVnq
 Hr7CrfnSd88A/rWJ4/OtRgKcEdAx7UrjCSFJOI9+Pqm4jV4P66CX6WJx4wVUMvLOzRl9
 4SWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kEmX/dhM7oGPxhjVmWlpUUsQZJsYHpeqYIWck3Kbyg4=;
 b=X/bepxgHXNnRq3W/Wqfw71haApDH4inbiDwj376HnrMOEPE/FEKvOoIurCOdSyH50P
 OB3pcj8dKQzm1b16vfSJhuXGcDr9A6vEc7UDNJcoCHn4r7W2pcKazBw+Isnq4t/zaTe4
 fLI39qRQGTIBzLafL3VtSqe1CyI5rFNCUpN/CEh4UllF+0xPEGsfuo1XS5rgCK3XGcCp
 rrGCz8HA8sh2XPSkTjFA0lLCzOhPlLjIzjV+0cljW8Aumqf8FyR1xWWe3jePuaCnE9eq
 rUE+LC2hMsVqw81QOimaGwEKxvXVw2RfdIHkVZfT55CQFbNM+PcmjqfBUaEID1wQRBLd
 IgYw==
X-Gm-Message-State: AA+aEWaTRkrC7zOSirnUO8Pdo+ldrOjnnmitLN+SH0wizuNGWmW22gLA
 V62qGLDLUMrY5EKW5BF4RaA4G2CTKO5NcmLAazu8AA==
X-Google-Smtp-Source: AFSGD/XlqvV8igK6M1weO1mRhuWJUfsjx07a6fihgithSbvWjdev56RUIfU9rqTVqI3VQ2G6g7IGxX68g9G3M6HSags=
X-Received: by 2002:ac8:7616:: with SMTP id t22mr3197129qtq.375.1544208807196; 
 Fri, 07 Dec 2018 10:53:27 -0800 (PST)
MIME-Version: 1.0
References: <a75abc9a6c5c2ae50b39576a60a2bb07c65567d4.camel@ozlabs.org>
 <94639b69-3f3c-a606-ae68-f7e1461097e9@linux.vnet.ibm.com>
 <f8fe02f703ab7c11bf5871605364821688266667.camel@arm.com>
In-Reply-To: <f8fe02f703ab7c11bf5871605364821688266667.camel@arm.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Fri, 7 Dec 2018 10:53:14 -0800
Message-ID: <CAJoAoZkPO+dU9VpzCm3C0y1aEFUS_MXBQsTaD_t=gNZN0JHg6A@mail.gmail.com>
Subject: Re: Initial MCTP design proposal
To: Supreeth Venkatesh <supreeth.venkatesh@arm.com>
Cc: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>, Jeremy Kerr <jk@ozlabs.org>,
 openbmc <openbmc@lists.ozlabs.org>, David Thompson <dthompson@mellanox.com>, 
 Dong Wei <Dong.Wei@arm.com>, "Naidoo, Nilan" <nilan.naidoo@intel.com>
Content-Type: multipart/alternative; boundary="0000000000006a022f057c7321ee"
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
X-List-Received-Date: Fri, 07 Dec 2018 18:53:31 -0000

--0000000000006a022f057c7321ee
Content-Type: text/plain; charset="UTF-8"

Hi Jeremy,

I had a couple comments on the initial draft.



On Fri, Dec 7, 2018 at 9:09 AM Supreeth Venkatesh <
supreeth.venkatesh@arm.com> wrote:

> On Fri, 2018-12-07 at 10:43 +0530, Deepak Kodihalli wrote:
> > On 07/12/18 8:11 AM, Jeremy Kerr wrote:
> > > Hi OpenBMCers!
> > >
> > > In an earlier thread, I promised to sketch out a design for a MCTP
> > > implementation in OpenBMC, and I've included it below.
> >
> >
> > Thanks Jeremy for sending this out. This looks good (have just one
> > comment below).
> >
> > Question for everyone : do you have plans to employ PLDM over MCTP?
> Yes Deepak. we do eventually.
>
> >
> > We are interested in PLDM for various "inside the box"
> > communications
> > (at the moment for the Host <-> BMC communication). I'd like to
> > propose
> > a design for a PLDM stack on OpenBMC, and would send a design
> > template
> > for review on the mailing list in some amount of time (I've just
> > started
> > with some initial sketches). I'd like to also know if others have
> > embarked on a similar activity, so that we can collaborate earlier
> > and
> > avoid duplicate work.
> Yes. Interested to collaborate.
> Which portion of PLDM are you working on, other than base?
> Platform Monitoring and Control?
> Firmware Update?
> BIOS Control andConfiguration?
> SMBIOS Transfer?
> FRU Data?
> Redfish Device Enablement?
>
> We are currently interested in Platform Monitoring and Control.
>
>
> >
> > > This is roughly in the OpenBMC design document format (thanks for
> > > the
> > > reminder Andrew), but I've sent it to the list for initial review
> > > before
> > > proposing to gerrit - mainly because there were a lot of folks who
> > > expressed interest on the list. I suggest we move to gerrit once we
> > > get
> > > specific feedback coming in. Let me know if you have general
> > > comments
> > > whenever you like though.
> > >
> > > In parallel, I've been developing a prototype for the MCTP library
> > > mentioned below, including a serial transport binding. I'll push to
> > > github soon and post a link, once I have it in a
> > > slightly-more-consumable form.
> > >
> > > Cheers,
> > >
> > >
> > > Jeremy
> > >
> > > --------------------------------------------------------
> > >
> > > # Host/BMC communication channel: MCTP & PLDM
> > >
> > > Author: Jeremy Kerr <jk@ozlabs.org> <jk>
> > >
> > > ## Problem Description
> > >
> > > Currently, we have a few different methods of communication between
> > > host
> > > and BMC. This is primarily IPMI-based, but also includes a few
> > > hardware-specific side-channels, like hiomap. On OpenPOWER hardware
> > > at
> > > least, we've definitely started to hit some of the limitations of
> > > IPMI
> > > (for example, we have need for >255 sensors), as well as the
> > > hardware
> > > channels that IPMI typically uses.
> > >
> > > This design aims to use the Management Component Transport Protocol
> > > (MCTP) to provide a common transport layer over the multiple
> > > channels
> > > that OpenBMC platforms provide. Then, on top of MCTP, we have the
> > > opportunity to move to newer host/BMC messaging protocols to
> > > overcome
> > > some of the limitations we've encountered with IPMI.
> > >
> > > ## Background and References
> > >
> > > Separating the "transport" and "messaging protocol" parts of the
> > > current
> > > stack allows us to design these parts separately. Currently, IPMI
> > > defines both of these; we currently have BT and KCS (both defined
> > > as
> > > part of the IPMI 2.0 standard) as the transports, and IPMI itself
> > > as the
> > > messaging protocol.
> > >
> > > Some efforts of improving the hardware transport mechanism of IPMI
> > > have
> > > been attempted, but not in a cross-implementation manner so far.
> > > This
> > > does not address some of the limitations of the IPMI data model.
> > >
> > > MCTP defines a standard transport protocol, plus a number of
> > > separate
> > > hardware bindings for the actual transport of MCTP packets. These
> > > are
> > > defined by the DMTF's Platform Management Working group; standards
> > > are
> > > available at:
> > >
> > >    https://www.dmtf.org/standards/pmci
> > >
> > > I have included a small diagram of how these standards may fit
> > > together
> > > in an OpenBMC system. The DSP numbers there are references to DMTF
> > > standards.
> > >
> > > One of the key concepts here is that separation of transport
> > > protocol
> > > from the hardware bindings; this means that an MCTP "stack" may be
> > > using
> > > either a I2C, PCI, Serial or custom hardware channel, without the
> > > higher
> > > layers of that stack needing to be aware of the hardware
> > > implementation.
> > > These higher levels only need to be aware that they are
> > > communicating
> > > with a certain entity, defined by an Entity ID (MCTP EID).
> > >
> > > I've mainly focussed on the "transport" part of the design here.
> > > While
> > > this does enable new messaging protocols (mainly PLDM), I haven't
> > > covered that much; we will propose those details for a separate
> > > design
> > > effort.
> > >
> > > As part of the design, I have referred to MCTP "messages" and
> > > "packets";
> > > this is intentional, to match the definitions in the MCTP standard.
> > > MCTP
> > > messages are the higher-level data transferred between MCTP
> > > endpoints,
> > > which packets are typically smaller, and are what is sent over the
> > > hardware. Messages that are larger than the hardware MTU are split
> > > into
> > > individual packets by the transmit implementation, and reassembled
> > > at
> > > the receive implementation.
> > >
> > > A final important point is that this design is for the host <-->
> > > BMC
> > > channel *only*. Even if we do replace IPMI for the host interface,
> > > we
> > > will certainly need an IPMI interface available for external system
> > > management.
>

I'm not sure it's correct to demand external IPMI. Most of OpenBMC
community (ourselves excluded :( ) is turning towards Redfish for this
role.  The external-facing IPMI specification is insecure at the standard
level, so I don't think that we should be encouraging or requiring it
anywhere, even in an unrelated doc.
tl;dr I think you should be more generic here and not specify IPMI for
external mgmt


> > >
> > > ## Requirements
> > >
> > > Any channel between host and BMC should:
> > >
> > >   - Have a simple serialisation and deserialisation format, to
> > > enable
> > >     implementations in host firmware, which have widely varying
> > > runtime
> > >     capabilities
> > >
> > >   - Allow different hardware channels, as we have a wide variety of
> > >     target platforms for OpenBMC
> > >
> > >   - Be usable over simple hardware implementations, but have a
> > > facility
> > >     for higher bandwidth messaging on platforms that require it.
> > >
> > >   - Ideally, integrate with newer messaging protocols
> > >
> > > ## Proposed Design
> > >
> > > The MCTP core specification just provides the packetisation,
> > > routing and
> > > addressing mechanisms. The actual transmit/receive of those packets
> > > is
> > > up to the hardware binding of the MCTP transport.
> > >
> > > For OpenBMC, we would introduce an MCTP daemon, which implements
> > > the
> > > transport over a configurable hardware channel (eg., Serial UART,
> > > I2C or
> > > PCI). This daemon is responsible for the packetisation and routing
> > > of
> > > MCTP messages to and from host firmware.
> > >
> > > I see two options for the "inbound" or "application" interface of
> > > the
> > > MCTP daemon:
> > >
> > >   - it could handle upper parts of the stack (eg PLDM) directly,
> > > through
> > >     in-process handlers that register for certain MCTP message
> > > types; or
> >
> > We'd like to somehow ensure (at least via documentation) that the
> > handlers don't block the MCTP daemon from processing incoming
> > traffic.
> > The handlers might anyway end up making IPC calls (via D-Bus) to
> > other
> > processes. The second approach below seems to alleviate this problem.
> >
> > >   - it could channel raw MCTP messages (reassembled from MCTP
> > > packets) to
> > >     DBUS messages (similar to the current IPMI host daemons), where
> > > the
> > >     upper layers receive and act on those DBUS events.
> > >
> > > I have a preference for the former, but I would be interested to
> > > hear
> > > from the IPMI folks about how the latter structure has worked in
> > > the
> > > past.
> > >
> > > The proposed implementation here is to produce an MCTP "library"
> > > which
> > > provides the packetisation and routing functions, between:
> > >
> > >   - an "upper" messaging transmit/receive interface, for tx/rx of a
> > > full
> > >     message to a specific endpoint
> > >
> > >   - a "lower" hardware binding for transmit/receive of individual
> > >     packets, providing a method for the core to tx/rx each packet
> > > to
> > >     hardware
> > >
> > > The lower interface would be plugged in to one of a number of
> > > hardware-specific binding implementations (most of which would be
> > > included in the library source tree, but others can be plugged-in
> > > too)
> > >
> > > The reason for a library is to allow the same MCTP implementation
> > > to be
> > > used in both OpenBMC and host firmware; the library should be
> > > bidirectional. To allow this, the library would be written in
> > > portable C
> > > (structured in a way that can be compiled as "extern C" in C++
> > > codebases), and be able to be configured to suit those runtime
> > > environments (for example, POSIX IO may not be available on all
> > > platforms; we should be able to compile the library to suit). The
> > > licence for the library should also allow this re-use; I'd suggest
> > > a
> > > dual Apache & GPL licence.
>

Love the idea of the implementation being bidirectional and able to be
dropped onto the host side as well, but I must be missing why that requires
we write it in C.  Are we targeting some platform missing a C++
cross-compiler implementation? If we're implementing something new from
scratch, I'd so much prefer to bump up the maintainability/modernity and
write it in C++ if we can.  Or could be I'm missing some key reason that it
follows we use C :)


> > >
> > > As for the hardware bindings, we would want to implement a serial
> > > transport binding first, to allow easy prototyping in simulation.
> > > For
> > > OpenPOWER, we'd want to implement a "raw LPC" binding for better
> > > performance, and later PCIe for large transfers. I imagine that
> > > there is
> > > a need for an I2C binding implementation for other hardware
> > > platforms
> > > too.
> > >
> > > Lastly, I don't want to exclude any currently-used interfaces by
> > > implementing MCTP - this should be an optional component of
> > > OpenBMC, and
> > > not require platforms to implement it.
> > >
> > > ## Alternatives Considered
> > >
> > > There have been two main alternatives to this approach:
> > >
> > > Continue using IPMI, but start making more use of OEM extensions to
> > > suit the requirements of new platforms. However, given that the
> > > IPMI
> > > standard is no longer under active development, we would likely end
> > > up
> > > with a large amount of platform-specific customisations. This also
> > > does
> > > not solve the hardware channel issues in a standard manner.
> > >
> > > Redfish between host and BMC. This would mean that host firmware
> > > needs a
> > > HTTP client, a TCP/IP stack, a JSON (de)serialiser, and support for
> > > Redfish schema. This is not feasible for all host firmware
> > > implementations; certainly not for OpenPOWER. It's possible that we
> > > could run a simplified Redfish stack - indeed, MCTP has a proposal
> > > for a
> > > Redfish-over-MCTP protocol, which uses simplified serialisation and
> > > no
> > > requirement on HTTP. However, this still introduces a large amount
> > > of
> > > complexity in host firmware.
> > >
> > > ## Impacts
> > >
> > > Development would be required to implement the MCTP transport, plus
> > > any
> > > new users of the MCTP messaging (eg, a PLDM implementation). These
> > > would
> > > somewhat duplicate the work we have in IPMI handlers.
> > >
> > > We'd want to keep IPMI running in parallel, so the "upgrade" path
> > > should
> > > be fairly straightforward.
> > >
> > > Design and development needs to involve potential host firmware
> > > implementations.
> > >
> > > ## Testing
> > >
> > > For the core MCTP library, we are able to run tests there in
> > > complete
> > > isolation (I have already been able to run a prototype MCTP stack
> > > through the afl fuzzer) to ensure that the core transport protocol
> > > works.
> > >
> > > For MCTP hardware bindings, we would develop channel-specific tests
> > > that
> > > would be run in CI on both host and BMC.
> > >
> > > For the OpenBMC MCTP daemon implementation, testing models would
> > > depend
> > > on the structure we adopt in the design section.
> > >
> >
> > Regards,
> > Deepak
> >
>
>

--0000000000006a022f057c7321ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Jeremy,<div><br></div><div>I had a couple comments on t=
he initial draft.</div><div><br></div><div><br></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr">On Fri, Dec 7, 2018 at 9:09 AM Supreeth Venkatesh=
 &lt;<a href=3D"mailto:supreeth.venkatesh@arm.com">supreeth.venkatesh@arm.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Fri, 2018-12-0=
7 at 10:43 +0530, Deepak Kodihalli wrote:<br>
&gt; On 07/12/18 8:11 AM, Jeremy Kerr wrote:<br>
&gt; &gt; Hi OpenBMCers!<br>
&gt; &gt; <br>
&gt; &gt; In an earlier thread, I promised to sketch out a design for a MCT=
P<br>
&gt; &gt; implementation in OpenBMC, and I&#39;ve included it below.<br>
&gt; <br>
&gt; <br>
&gt; Thanks Jeremy for sending this out. This looks good (have just one <br=
>
&gt; comment below).<br>
&gt; <br>
&gt; Question for everyone : do you have plans to employ PLDM over MCTP?<br=
>
Yes Deepak. we do eventually.<br>
<br>
&gt; <br>
&gt; We are interested in PLDM for various &quot;inside the box&quot;<br>
&gt; communications <br>
&gt; (at the moment for the Host &lt;-&gt; BMC communication). I&#39;d like=
 to<br>
&gt; propose <br>
&gt; a design for a PLDM stack on OpenBMC, and would send a design<br>
&gt; template <br>
&gt; for review on the mailing list in some amount of time (I&#39;ve just<b=
r>
&gt; started <br>
&gt; with some initial sketches). I&#39;d like to also know if others have =
<br>
&gt; embarked on a similar activity, so that we can collaborate earlier<br>
&gt; and <br>
&gt; avoid duplicate work.<br>
Yes. Interested to collaborate.<br>
Which portion of PLDM are you working on, other than base?<br>
Platform Monitoring and Control?<br>
Firmware Update?<br>
BIOS Control andConfiguration?<br>
SMBIOS Transfer?<br>
FRU Data?<br>
Redfish Device Enablement?<br>
<br>
We are currently interested in Platform Monitoring and Control.<br>
<br>
<br>
&gt; <br>
&gt; &gt; This is roughly in the OpenBMC design document format (thanks for=
<br>
&gt; &gt; the<br>
&gt; &gt; reminder Andrew), but I&#39;ve sent it to the list for initial re=
view<br>
&gt; &gt; before<br>
&gt; &gt; proposing to gerrit - mainly because there were a lot of folks wh=
o<br>
&gt; &gt; expressed interest on the list. I suggest we move to gerrit once =
we<br>
&gt; &gt; get<br>
&gt; &gt; specific feedback coming in. Let me know if you have general<br>
&gt; &gt; comments<br>
&gt; &gt; whenever you like though.<br>
&gt; &gt; <br>
&gt; &gt; In parallel, I&#39;ve been developing a prototype for the MCTP li=
brary<br>
&gt; &gt; mentioned below, including a serial transport binding. I&#39;ll p=
ush to<br>
&gt; &gt; github soon and post a link, once I have it in a<br>
&gt; &gt; slightly-more-consumable form.<br>
&gt; &gt; <br>
&gt; &gt; Cheers,<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; Jeremy<br>
&gt; &gt; <br>
&gt; &gt; --------------------------------------------------------<br>
&gt; &gt; <br>
&gt; &gt; # Host/BMC communication channel: MCTP &amp; PLDM<br>
&gt; &gt; <br>
&gt; &gt; Author: Jeremy Kerr &lt;<a href=3D"mailto:jk@ozlabs.org" target=
=3D"_blank">jk@ozlabs.org</a>&gt; &lt;jk&gt;<br>
&gt; &gt; <br>
&gt; &gt; ## Problem Description<br>
&gt; &gt; <br>
&gt; &gt; Currently, we have a few different methods of communication betwe=
en<br>
&gt; &gt; host<br>
&gt; &gt; and BMC. This is primarily IPMI-based, but also includes a few<br=
>
&gt; &gt; hardware-specific side-channels, like hiomap. On OpenPOWER hardwa=
re<br>
&gt; &gt; at<br>
&gt; &gt; least, we&#39;ve definitely started to hit some of the limitation=
s of<br>
&gt; &gt; IPMI<br>
&gt; &gt; (for example, we have need for &gt;255 sensors), as well as the<b=
r>
&gt; &gt; hardware<br>
&gt; &gt; channels that IPMI typically uses.<br>
&gt; &gt; <br>
&gt; &gt; This design aims to use the Management Component Transport Protoc=
ol<br>
&gt; &gt; (MCTP) to provide a common transport layer over the multiple<br>
&gt; &gt; channels<br>
&gt; &gt; that OpenBMC platforms provide. Then, on top of MCTP, we have the=
<br>
&gt; &gt; opportunity to move to newer host/BMC messaging protocols to<br>
&gt; &gt; overcome<br>
&gt; &gt; some of the limitations we&#39;ve encountered with IPMI.<br>
&gt; &gt; <br>
&gt; &gt; ## Background and References<br>
&gt; &gt; <br>
&gt; &gt; Separating the &quot;transport&quot; and &quot;messaging protocol=
&quot; parts of the<br>
&gt; &gt; current<br>
&gt; &gt; stack allows us to design these parts separately. Currently, IPMI=
<br>
&gt; &gt; defines both of these; we currently have BT and KCS (both defined=
<br>
&gt; &gt; as<br>
&gt; &gt; part of the IPMI 2.0 standard) as the transports, and IPMI itself=
<br>
&gt; &gt; as the<br>
&gt; &gt; messaging protocol.<br>
&gt; &gt; <br>
&gt; &gt; Some efforts of improving the hardware transport mechanism of IPM=
I<br>
&gt; &gt; have<br>
&gt; &gt; been attempted, but not in a cross-implementation manner so far.<=
br>
&gt; &gt; This<br>
&gt; &gt; does not address some of the limitations of the IPMI data model.<=
br>
&gt; &gt; <br>
&gt; &gt; MCTP defines a standard transport protocol, plus a number of<br>
&gt; &gt; separate<br>
&gt; &gt; hardware bindings for the actual transport of MCTP packets. These=
<br>
&gt; &gt; are<br>
&gt; &gt; defined by the DMTF&#39;s Platform Management Working group; stan=
dards<br>
&gt; &gt; are<br>
&gt; &gt; available at:<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 <a href=3D"https://www.dmtf.org/standards/pmci" rel=
=3D"noreferrer" target=3D"_blank">https://www.dmtf.org/standards/pmci</a><b=
r>
&gt; &gt; <br>
&gt; &gt; I have included a small diagram of how these standards may fit<br=
>
&gt; &gt; together<br>
&gt; &gt; in an OpenBMC system. The DSP numbers there are references to DMT=
F<br>
&gt; &gt; standards.<br>
&gt; &gt; <br>
&gt; &gt; One of the key concepts here is that separation of transport<br>
&gt; &gt; protocol<br>
&gt; &gt; from the hardware bindings; this means that an MCTP &quot;stack&q=
uot; may be<br>
&gt; &gt; using<br>
&gt; &gt; either a I2C, PCI, Serial or custom hardware channel, without the=
<br>
&gt; &gt; higher<br>
&gt; &gt; layers of that stack needing to be aware of the hardware<br>
&gt; &gt; implementation.<br>
&gt; &gt; These higher levels only need to be aware that they are<br>
&gt; &gt; communicating<br>
&gt; &gt; with a certain entity, defined by an Entity ID (MCTP EID).<br>
&gt; &gt; <br>
&gt; &gt; I&#39;ve mainly focussed on the &quot;transport&quot; part of the=
 design here.<br>
&gt; &gt; While<br>
&gt; &gt; this does enable new messaging protocols (mainly PLDM), I haven&#=
39;t<br>
&gt; &gt; covered that much; we will propose those details for a separate<b=
r>
&gt; &gt; design<br>
&gt; &gt; effort.<br>
&gt; &gt; <br>
&gt; &gt; As part of the design, I have referred to MCTP &quot;messages&quo=
t; and<br>
&gt; &gt; &quot;packets&quot;;<br>
&gt; &gt; this is intentional, to match the definitions in the MCTP standar=
d.<br>
&gt; &gt; MCTP<br>
&gt; &gt; messages are the higher-level data transferred between MCTP<br>
&gt; &gt; endpoints,<br>
&gt; &gt; which packets are typically smaller, and are what is sent over th=
e<br>
&gt; &gt; hardware. Messages that are larger than the hardware MTU are spli=
t<br>
&gt; &gt; into<br>
&gt; &gt; individual packets by the transmit implementation, and reassemble=
d<br>
&gt; &gt; at<br>
&gt; &gt; the receive implementation.<br>
&gt; &gt; <br>
&gt; &gt; A final important point is that this design is for the host &lt;-=
-&gt;<br>
&gt; &gt; BMC<br>
&gt; &gt; channel *only*. Even if we do replace IPMI for the host interface=
,<br>
&gt; &gt; we<br>
&gt; &gt; will certainly need an IPMI interface available for external syst=
em<br>
&gt; &gt; management.<br></blockquote><div><br></div><div>I&#39;m not sure =
it&#39;s correct to demand external IPMI. Most of OpenBMC community (oursel=
ves excluded :( ) is turning towards Redfish for this role.=C2=A0 The exter=
nal-facing IPMI specification is insecure at the standard level, so I don&#=
39;t think that we should be encouraging or requiring it anywhere, even in =
an unrelated doc.</div><div>tl;dr I think you should be more generic here a=
nd not specify IPMI for external mgmt</div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">
&gt; &gt; <br>
&gt; &gt; ## Requirements<br>
&gt; &gt; <br>
&gt; &gt; Any channel between host and BMC should:<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0- Have a simple serialisation and deserialisation for=
mat, to<br>
&gt; &gt; enable<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0implementations in host firmware, which have w=
idely varying<br>
&gt; &gt; runtime<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0capabilities<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0- Allow different hardware channels, as we have a wid=
e variety of<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0target platforms for OpenBMC<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0- Be usable over simple hardware implementations, but=
 have a<br>
&gt; &gt; facility<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0for higher bandwidth messaging on platforms th=
at require it.<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0- Ideally, integrate with newer messaging protocols<b=
r>
&gt; &gt; <br>
&gt; &gt; ## Proposed Design<br>
&gt; &gt; <br>
&gt; &gt; The MCTP core specification just provides the packetisation,<br>
&gt; &gt; routing and<br>
&gt; &gt; addressing mechanisms. The actual transmit/receive of those packe=
ts<br>
&gt; &gt; is<br>
&gt; &gt; up to the hardware binding of the MCTP transport.<br>
&gt; &gt; <br>
&gt; &gt; For OpenBMC, we would introduce an MCTP daemon, which implements<=
br>
&gt; &gt; the<br>
&gt; &gt; transport over a configurable hardware channel (eg., Serial UART,=
<br>
&gt; &gt; I2C or<br>
&gt; &gt; PCI). This daemon is responsible for the packetisation and routin=
g<br>
&gt; &gt; of<br>
&gt; &gt; MCTP messages to and from host firmware.<br>
&gt; &gt; <br>
&gt; &gt; I see two options for the &quot;inbound&quot; or &quot;applicatio=
n&quot; interface of<br>
&gt; &gt; the<br>
&gt; &gt; MCTP daemon:<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0- it could handle upper parts of the stack (eg PLDM) =
directly,<br>
&gt; &gt; through<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0in-process handlers that register for certain =
MCTP message<br>
&gt; &gt; types; or<br>
&gt; <br>
&gt; We&#39;d like to somehow ensure (at least via documentation) that the =
<br>
&gt; handlers don&#39;t block the MCTP daemon from processing incoming<br>
&gt; traffic. <br>
&gt; The handlers might anyway end up making IPC calls (via D-Bus) to<br>
&gt; other <br>
&gt; processes. The second approach below seems to alleviate this problem.<=
br>
&gt; <br>
&gt; &gt;=C2=A0 =C2=A0- it could channel raw MCTP messages (reassembled fro=
m MCTP<br>
&gt; &gt; packets) to<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0DBUS messages (similar to the current IPMI hos=
t daemons), where<br>
&gt; &gt; the<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0upper layers receive and act on those DBUS eve=
nts.<br>
&gt; &gt; <br>
&gt; &gt; I have a preference for the former, but I would be interested to<=
br>
&gt; &gt; hear<br>
&gt; &gt; from the IPMI folks about how the latter structure has worked in<=
br>
&gt; &gt; the<br>
&gt; &gt; past.<br>
&gt; &gt; <br>
&gt; &gt; The proposed implementation here is to produce an MCTP &quot;libr=
ary&quot;<br>
&gt; &gt; which<br>
&gt; &gt; provides the packetisation and routing functions, between:<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0- an &quot;upper&quot; messaging transmit/receive int=
erface, for tx/rx of a<br>
&gt; &gt; full<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0message to a specific endpoint<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0- a &quot;lower&quot; hardware binding for transmit/r=
eceive of individual<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0packets, providing a method for the core to tx=
/rx each packet<br>
&gt; &gt; to<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0hardware<br>
&gt; &gt; <br>
&gt; &gt; The lower interface would be plugged in to one of a number of<br>
&gt; &gt; hardware-specific binding implementations (most of which would be=
<br>
&gt; &gt; included in the library source tree, but others can be plugged-in=
<br>
&gt; &gt; too)<br>
&gt; &gt; <br>
&gt; &gt; The reason for a library is to allow the same MCTP implementation=
<br>
&gt; &gt; to be<br>
&gt; &gt; used in both OpenBMC and host firmware; the library should be<br>
&gt; &gt; bidirectional. To allow this, the library would be written in<br>
&gt; &gt; portable C<br>
&gt; &gt; (structured in a way that can be compiled as &quot;extern C&quot;=
 in C++<br>
&gt; &gt; codebases), and be able to be configured to suit those runtime<br=
>
&gt; &gt; environments (for example, POSIX IO may not be available on all<b=
r>
&gt; &gt; platforms; we should be able to compile the library to suit). The=
<br>
&gt; &gt; licence for the library should also allow this re-use; I&#39;d su=
ggest<br>
&gt; &gt; a<br>
&gt; &gt; dual Apache &amp; GPL licence.<br></blockquote><div><br></div><di=
v>Love the idea of the implementation being bidirectional and able to be dr=
opped onto the host side as well, but I must be missing why that requires w=
e write it in C.=C2=A0 Are we targeting some platform missing a C++ cross-c=
ompiler implementation? If we&#39;re implementing something new from scratc=
h, I&#39;d so much prefer to bump up the maintainability/modernity and writ=
e it in C++ if we can.=C2=A0 Or could be I&#39;m missing some key reason th=
at it follows we use C :)</div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">
&gt; &gt; <br>
&gt; &gt; As for the hardware bindings, we would want to implement a serial=
<br>
&gt; &gt; transport binding first, to allow easy prototyping in simulation.=
<br>
&gt; &gt; For<br>
&gt; &gt; OpenPOWER, we&#39;d want to implement a &quot;raw LPC&quot; bindi=
ng for better<br>
&gt; &gt; performance, and later PCIe for large transfers. I imagine that<b=
r>
&gt; &gt; there is<br>
&gt; &gt; a need for an I2C binding implementation for other hardware<br>
&gt; &gt; platforms<br>
&gt; &gt; too.<br>
&gt; &gt; <br>
&gt; &gt; Lastly, I don&#39;t want to exclude any currently-used interfaces=
 by<br>
&gt; &gt; implementing MCTP - this should be an optional component of<br>
&gt; &gt; OpenBMC, and<br>
&gt; &gt; not require platforms to implement it.<br>
&gt; &gt; <br>
&gt; &gt; ## Alternatives Considered<br>
&gt; &gt; <br>
&gt; &gt; There have been two main alternatives to this approach:<br>
&gt; &gt; <br>
&gt; &gt; Continue using IPMI, but start making more use of OEM extensions =
to<br>
&gt; &gt; suit the requirements of new platforms. However, given that the<b=
r>
&gt; &gt; IPMI<br>
&gt; &gt; standard is no longer under active development, we would likely e=
nd<br>
&gt; &gt; up<br>
&gt; &gt; with a large amount of platform-specific customisations. This als=
o<br>
&gt; &gt; does<br>
&gt; &gt; not solve the hardware channel issues in a standard manner.<br>
&gt; &gt; <br>
&gt; &gt; Redfish between host and BMC. This would mean that host firmware<=
br>
&gt; &gt; needs a<br>
&gt; &gt; HTTP client, a TCP/IP stack, a JSON (de)serialiser, and support f=
or<br>
&gt; &gt; Redfish schema. This is not feasible for all host firmware<br>
&gt; &gt; implementations; certainly not for OpenPOWER. It&#39;s possible t=
hat we<br>
&gt; &gt; could run a simplified Redfish stack - indeed, MCTP has a proposa=
l<br>
&gt; &gt; for a<br>
&gt; &gt; Redfish-over-MCTP protocol, which uses simplified serialisation a=
nd<br>
&gt; &gt; no<br>
&gt; &gt; requirement on HTTP. However, this still introduces a large amoun=
t<br>
&gt; &gt; of<br>
&gt; &gt; complexity in host firmware.<br>
&gt; &gt; <br>
&gt; &gt; ## Impacts<br>
&gt; &gt; <br>
&gt; &gt; Development would be required to implement the MCTP transport, pl=
us<br>
&gt; &gt; any<br>
&gt; &gt; new users of the MCTP messaging (eg, a PLDM implementation). Thes=
e<br>
&gt; &gt; would<br>
&gt; &gt; somewhat duplicate the work we have in IPMI handlers.<br>
&gt; &gt; <br>
&gt; &gt; We&#39;d want to keep IPMI running in parallel, so the &quot;upgr=
ade&quot; path<br>
&gt; &gt; should<br>
&gt; &gt; be fairly straightforward.<br>
&gt; &gt; <br>
&gt; &gt; Design and development needs to involve potential host firmware<b=
r>
&gt; &gt; implementations.<br>
&gt; &gt; <br>
&gt; &gt; ## Testing<br>
&gt; &gt; <br>
&gt; &gt; For the core MCTP library, we are able to run tests there in<br>
&gt; &gt; complete<br>
&gt; &gt; isolation (I have already been able to run a prototype MCTP stack=
<br>
&gt; &gt; through the afl fuzzer) to ensure that the core transport protoco=
l<br>
&gt; &gt; works.<br>
&gt; &gt; <br>
&gt; &gt; For MCTP hardware bindings, we would develop channel-specific tes=
ts<br>
&gt; &gt; that<br>
&gt; &gt; would be run in CI on both host and BMC.<br>
&gt; &gt; <br>
&gt; &gt; For the OpenBMC MCTP daemon implementation, testing models would<=
br>
&gt; &gt; depend<br>
&gt; &gt; on the structure we adopt in the design section.<br>
&gt; &gt; <br>
&gt; <br>
&gt; Regards,<br>
&gt; Deepak<br>
&gt; <br>
<br>
</blockquote></div></div>

--0000000000006a022f057c7321ee--
