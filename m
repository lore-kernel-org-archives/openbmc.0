Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::235; helo=mail-vk0-x235.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="lb5OwwH/"; 
 dkim-atps=neutral
Received: from mail-vk0-x235.google.com (mail-vk0-x235.google.com
 [IPv6:2607:f8b0:400c:c05::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xtQTf2hRDzDrVw
 for <openbmc@lists.ozlabs.org>; Fri, 15 Sep 2017 03:27:50 +1000 (AEST)
Received: by mail-vk0-x235.google.com with SMTP id z187so4281vkd.13
 for <openbmc@lists.ozlabs.org>; Thu, 14 Sep 2017 10:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=4cgLfoZXu9SSqOxwKmCveTPIJZZO3E9V+RL6SOETufU=;
 b=lb5OwwH/RYsVdfalMvejqDpAYyBLn3hV9XhKkn041kZwvkKpekehEfvqqbumXowaS+
 9JeW3bDh3DiOQgkKokwFaiItGwRE9PGjAmvqV4xxlA1+r7mve3WHsBNm7ta0rLFttdmh
 JdOEurbFNhs7qQ6ryZekNi8E2TcWbGEf/DYiiPSC8B2XzhYeC+uzqxnpzYOH8D7endnc
 mKi9KGjHyKjzrcUf2PnW2w9CtpEd6rlmeJBAYwcH8s7vK4wmrlexxwd7b61j7hmhnz/y
 OhHRmLSoGm9CdHf2mDHp83d5JqsSxh82Z9kNXfMvTgjIh38cE8lcUq7hV3CM41CDODyg
 XgSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=4cgLfoZXu9SSqOxwKmCveTPIJZZO3E9V+RL6SOETufU=;
 b=Qh5ss3XHFRzWkO6m0cmIiWslfKWt6teo2mtP8pOYugom6EUgZETlTw8dmLrmJSYihh
 J+XuO9RFMvCdfpE4y8u/lAocyrgFq/9BjZ7OGLTeJN9RHdeTJ8fmcvbwSkCM/xmgNRGc
 34PVDE/6r4+JfFbh7XYUKZdKryUA7N2GPMeIvw5xvvbtlZWgTzwl9GabTkya5vt1jTZt
 +17B9Pkh94E/Z4j8wcnkMEziR+weMCfiV74m3Jk88qknDFkUGdwoZ9DHKwX1js43oL95
 LE08w2S7x3R20PFbDkk6tFmWZIWvJAZjeZ/SkSdHrrt/QGjf8lvwoz/qcIc7UyA2WabT
 gdIA==
X-Gm-Message-State: AHPjjUiKb8GAuRN/2A3eKoX0X+cgIWUCqFjPdsDI5xfbQFCLhsXppvaP
 c6O5ATixPVudYyXoAxaejInLLKY7iYZ7y5h+bw2cyw==
X-Google-Smtp-Source: AOwi7QDUG0YVL5L71LPF54Ds6JSA6OqG+SFLGKNYxPhNoxaJKJLzMFCb40p/EHa7Xrh02goM9aWxFLYXxfezGMjrCRs=
X-Received: by 10.31.0.69 with SMTP id 66mr16409666vka.102.1505410067406; Thu,
 14 Sep 2017 10:27:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.178.18 with HTTP; Thu, 14 Sep 2017 10:27:26 -0700 (PDT)
In-Reply-To: <CAFd5g461uDs=is_W9-fSX=kWfMER-hS-auMoEPBDYJ6BWo6gwQ@mail.gmail.com>
References: <CAFd5g461uDs=is_W9-fSX=kWfMER-hS-auMoEPBDYJ6BWo6gwQ@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 14 Sep 2017 10:27:26 -0700
Message-ID: <CAO=notzomSA3ZD-CtBDaxSEjpygWRs_y=Pj02W5zPDiapLWWSA@mail.gmail.com>
Subject: Re: Generic Flash Access
To: Brendan Higgins <brendanhiggins@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Nancy Yuen <yuenn@google.com>,
 Kun Yi <kunyi@google.com>, Corey Minyard <minyard@acm.org>
Content-Type: multipart/alternative; boundary="001a113da99a4faa7205592998df"
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
X-List-Received-Date: Thu, 14 Sep 2017 17:27:51 -0000

--001a113da99a4faa7205592998df
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 21, 2017 at 2:13 PM, Brendan Higgins <brendanhiggins@google.com>
wrote:

> Hello all,
>
> Nancy has informed me that there is some renewed interest in our Generic
> Flash
> Access mechanism and I know people have been asking for it for a while now,
> here it finally is!
>
> Our design has evolved quite a bit since it was originally shared (original
> proposal can be found here
> https://lists.ozlabs.org/pipermail/openbmc/2016-October/005131.html for
> anyone
> interested), so I think it makes sense to start from scratch.
>
> I decided to add Corey Minyard, the Linux IPMI maintainer on this email as
> well
> because I think he will have some useful insights and this will also shed
> some
> light on the types of things we are trying to get our BMC to do as well as
> our
> conceptual approach.
>
> Also, before anyone says anything, I am aware that Generic Flash Access and
> Generic Transport Layer are not great names, but we have not thought of
> anything
> better yet. If anyone has any suggestions of better names, or any
> suggestions of
> any sort, please feel free to share.
>
> The primary motivation for Generic Flash Access is that there is no generic
> flash access mechanism that is available to all BMC based systems. LPC
> based
> mailbox is not available on all platforms and thus cannot be the sole
> basis for
> a generic mechanism. Furthermore, we have many types of operations that we
> would
> like to do with flash that do not fit well into the mailbox model.
>

Definitely the case.  Any approach should be something that can be
implemented per system.  Such that the data and the command & control can
go over separate channels.  And that they don't imply direct flash access.


> Generic Flash Access is composed of two parts: the Generic Transport
> Layer, and
> the Generic Flash Access Protocol.
>
> The Generic Transport Layer (GTL) attempts to provide an abstract stream
> oriented interface between the BMC and the host CPU. It accomplishes this
> by
> piggy-backing on another pre-existing interface, currently IPMI, however,
> others
> are possible.
>
> Conceptually, GTL sort of looks like a net device. A user would open a
> "socket";
> in this case, would request a transaction id, and then would be able to
> write
> arbitrary data which would be sent as a request. The request would be
> routed to
> a handler on the opposite side which would parse the request and send a
> response, which could be then read by the requester. A request may be
> initialized by either the BMC or the host.
>
> GTL is essentially a packetization specification for arbitrary data, with
> bindings on other protocols. Given an arbitrary piece of data, GTL breaks
> the
> data up into packets:
>
> ```
> struct packet {
>     uint8 transaction_id;
>     uint8 control;
>     uint32 seq;
>     uint8 checksum;
>     uint8 payload[];
> };
> ```
>

This packet doesn't have a payload size.  Also is an 8-bit checksum
worthwhile instead of a 16-bit checksum?  If the data is sufficiently
large, the 8-bit checksum loses a lot of value.

I'm less worried about the 32-bit for the sequence number as that'll work
for quite some time (famous last words).  I don't think it's worth adding a
timestamp field as was done to address sequence overflow in TCP.


>
> where `transaction_id` allows packets to be associated with a given
> transaction
> so that multiple transactions can be in progress all at once. The most
> significant bit identifies whether the transaction was originated by the
> host or
> the BMC; if it is unset it is from the host, if it is set, it is from the
> BMC.
> In this way, each endpoint only has to keep track of allocations for its
> transaction IDs.
>
> `control` is a bit field:
>
>   * 7:3 reserved for future use
>   * 2:0 an enum:
>     - 000 final packet: indicates that it is the last packet in a message.
>     - 001 not final packet: indicates that there are subsequent packets in
> the
>           message.
>     - 010 retransmit request: requests that all packets after the specified
>           packet, using the seq field, should be resent.
>     - 011 ack: indicates that the last packet for a message was received.
>     - 100 invalid state: indicates that a response packet was received for
> a
>           unknown request.
>     - 1xx reserved for future use: packets using invalid (reserved) control
>           codes must be silently dropped.
>
> `seq` is a sequence number that is incremented for each packet, for a retry
> packet the sequence number is the last packet it received correctly, or 0
> if it
> has not received the first packet.
>
> `checksum` is a CRC 8 checksum that includes all of the data of the packet
> with
> the exception of itself. If the checksum in a received packet is invalid,
> the
> packet is dropped and a retransmit request with the previous sequence
> number is
> sent.
>
> GTL itself is divided into two layers: the transaction layer and the link
> layer.
>
> The transaction layer is common across all GTL implementations and is
> responsible for translating a message (a request or a response) into a
> series
> of packets and then translating packets back into messages. When the
> transaction
> layer receives a packet, it finds the rx queue associated with the packet's
> transaction ID and then checks to see if the packet's sequence number
> immediately follows the previous; if it does, it is added to the queue; if
> not,
> it is dropped and a retransmit request is sent with the last sequence
> number it
> correctly received or zero if no packets have been received for that
> transaction. If the packet is marked "no more data available", the message
> is
> assembled and passed to the user and an ack is sent. If there is no active
> transaction for the packet, meaning a response packet was received and
> there is
> no associated request, an invalid state packet is sent with the same
> transaction
> ID, and sequence number.
>

Just to verify, if you're sending a 32MB message, I don't think it's
prudent to rebuild the entire message in memory before passing it to the
receiving end of the "socket."

In the prototype implementation design, are you planning on having
something effectively call "recv" on some library implementing this, with
similar semantics to Berkeley sockets?


>
> Sending a packet must follow the above rules. It must retain all packets
> associated with a message until an ack is sent. If it receives an invalid
> state
> response, it must cancel the corresponding request, if one exists; it may,
> but
> is not required to take additional action. NB: the most likely explanation
> for
> an invalid state packet is that the endpoint being communicated with was
> reset.
> Other methods of detecting endpoint resets are encouraged and may be used
> to
> cancel requests.
>
> Although not required for correct functionality, each message will be
> selected
> according to a round robin strategy from which to send a packet; however,
> retransmit, ack, and invalid state packets will always be sent before other
> packets.
>
> The link layer is specific to the underlying protocol and is onlg
> responsible
> for exchanging packets between the BMC and the host. For IPMI, the host
> will
> continually send GTL IPMI OEM requests to the BMC; if there are any
> packets to
> send, the body of the IPMI request will contain the next packet to send as
> determined by the transaction layer; the BMC will then complete the
> request with
> the next packet as determined by its transaction layer. If either side has
> nothing to send, the corresponding body will simply be left empty. When
> the link
> layer is sending the final packet in a message; the next packet that it
> receives
> should be an ACK because ACK packets have higher priority than all other
> packets; if an ACK was not received, an error occurred and the link layer
> should
> retransmit the final packet unless requested to retransmit an earlier
> packet as
> directed by a retransmit request.
>

This made sense for me until the messages portion that's living on top of,
but really next to, or both.  Can you elaborate a use-case more fully with
pseudo-code?


>
> The host's link layer will issue a GTL IPMI OEM request whenever it has
> packets
> available to send. It must also issue a GTL IPMI OEM request if the
> response to
> the previous request contained a packet. If neither of these conditions are
> true, the host will periodically send empty requests to see if the BMC has
> anything to send. We could also maybe take advantage of `SMS_ATN`, but I
> do not
> think that is important now.
>
> As I mentioned, the Generic Flash Access Protocol is built on top of GTL:
> if GTL
> is analogous to TCP, GFA is analogous to a REST interface. All it is is a
> set of
> messages mapped to a particular transaction id. GFA is just a set of
> protocol
> buffer messages:
>

This comparison is confusing to me.  REST is a layer that is directly tied
to data with actions-driven endpoints.  In the use-case you're describing,
-- well, I'm confused.  I plan to upload the image over mechanism in big
data packets (64KB minus headers), and handle all C2 (command & control)
over IPMI OEM.

In the use-case I'm designing, there is a setup step that precedes being
able to even send the data.  Is that all handled by the receiver of the
messages or should there be "ready to send" type messages?


>
> ```
> message RawFlashRequest {
>   message Read {
>     uint64 offset = 1;
>     uint64 size = 2;
>   }
>
>   message Write {
>     uint64 offset = 1;
>     bytes data = 2;
>   }
>
> Per the security of our environment, we are disallowing direct write to
the flash chip itself.  We'll be staging the image and cryptographically
verifying it before flashing it.  Presumably whatever mechanism is parsing
and handling the protobufs will handle that implementation.

To send the cryptographic signature, should a separate mechanism be used,
possibly also over GTL, or would this protobuf set be extended?


>   message Info {
>   }
>
>   message Checksum {
>     uint64 offset = 1;
>     uint64 size = 2;
>   }
>

I'm not familiar with protobufs but I don't a corresponding response to the
Checksum request type.


>
>   bytes partition_guid = 1;
>
>   oneof request {
>     Read read = 2;
>     Write write = 3;
>     Info info = 4;
>     Checksum checksum = 5;
>   }
> }
>
> message RawFlashResponse {
>   message Info {
>     bytes guid = 1;
>     uint64 block_size = 2;
>     uint64 num_blocks = 3;
>     bool read_only = 4;
>   }
>
>   oneof response {      // Empty for Write
>     Info info = 1;      // from Info
>     bytes data = 2;     // from Read
>     bytes checksum = 3; // from Checksum
>   }
> }
>
> message PblogRequest {
>   message GetBootnum {
>   }
>
>   message WriteEvent {
>     bytes payload = 1;
>   }
>
>   message GetRawRegions {
>   }
>
>   oneof request {
>     GetBootnum get_bootnum = 1;
>     WriteEvent write_event = 2;
>     GetRawRegions get_raw_regions = 3;
>   }
> }
>
> message PblogResponse {
>   oneof response {         // Empty for write_event
>     uint32 bootnum = 1;    // from GetBootnum
>     bytes raw_regions = 2; // from GetRawRegions
>   }
> }
>
> message FirmwareUpdateRequest {
>   bytes checksum = 1;
>   bytes payload = 2;
> }
>
> message FirmwareUpdateResponse {
> }
>
> message GfaRequest {
>   oneof request {
>     RawFlashRequest raw_request = 1;
>     PblogRequest pblog_request = 2;
>     FirmwareUpdateRequest firmware_update_request = 3;
>   }
> }
>
> message GfaResponse {
>   bool success = 1;
>   string error = 2; // Set when success == false
>
>   oneof response {
>     RawFlashResponse raw_response = 3;
>     PblogResponse pblog_response = 4;
>     FirmwareUpdateResponse firmware_update_response = 5;
>   }
> }
> ```
>
Unlike GTL, which is a strictly defined protocol, the above GFA messages are
> more of a suggestion of operations that would be provided. The reason we
> chose
> protobufs is that protobufs, are an efficient encoding, and more
> importantly
> that they are extensable.


Are protobufs sufficiently widely accepted that using them here is
worthwhile?  I don't see anything in the structures that can't be equally
compactly represented via normal data structures, and are just as
extensible.


> The reason that this is so important is that a flash
> chip is likely to have multiple partitions that each have its own security
> policy; for example, a CPU flash chip is likely to have a firmware image,
> which
> should only be updated with cryptographically signed updates, but it will
> also
> have an NVRAM variable section, which depending on the BIOS implementation
> could
> have variables that could effect the security of the BIOS and they may
> not; we
> also have our own system event log called PBLog; most would probably not be
> interested in this, but it is a good example of a message type that the
> host
> should be able to send us at anytime and the only policy we would likely
> have is
> rate limiting.
>
> In addition to allowing easy modification to meet the needs of different
> systems, using a mechanism that readily allows modification means that the
> protocol can be updated and can evolve over time.
>
> In summary, the only required messages are GfaRequest and GfaResponse,
> which can
> be modified to support arbitrary functionality.
>
> On a side note, all of the mechanisms provided above can be used to
> implement
> other arbitrary protocols; for example, we have implemented I2C passthrough
> using raw IPMI OEM messages, which have some short comings due to the
> length
> restrictions of IPMI messages; using the above mechanisms, GTL with
> protobufs,
> implementing I2C passthrough would be very easy. The possibility of
> implementing
> other protocols beyond GFA is why I decided to support multiple concurrent
> transactions.
>
> We are planning on implementing GTL within the kernel as its own
> framework. The
> IPMI based link layer implementation is intended to be implemented on top
> of the
> BMC side IPMI framework I have been discussing with Corey. I think my
> decision
> to put it here is intuitive since it is really supposed to be a hardware
> abstraction of sorts, but we can discuss it if it is not obvious.
>
> Currently, GFA has a userland tool to be used from the host and a BMC side
> daemon. The daemon is mostly complete; the tool is basically a wrapper
> around
> the protobufs listed above, so there is not much to do.
>
> Cheers!
>

--001a113da99a4faa7205592998df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On M=
on, Aug 21, 2017 at 2:13 PM, Brendan Higgins <span dir=3D"ltr">&lt;<a href=
=3D"mailto:brendanhiggins@google.com" target=3D"_blank">brendanhiggins@goog=
le.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">Hello all,<br>
<br>
Nancy has informed me that there is some renewed interest in our Generic Fl=
ash<br>
Access mechanism and I know people have been asking for it for a while now,=
<br>
here it finally is!<br>
<br>
Our design has evolved quite a bit since it was originally shared (original=
<br>
proposal can be found here<br>
<a href=3D"https://lists.ozlabs.org/pipermail/openbmc/2016-October/005131.h=
tml" rel=3D"noreferrer" target=3D"_blank">https://lists.ozlabs.org/<wbr>pip=
ermail/openbmc/2016-<wbr>October/005131.html</a> for anyone<br>
interested), so I think it makes sense to start from scratch.<br>
<br>
I decided to add Corey Minyard, the Linux IPMI maintainer on this email as =
well<br>
because I think he will have some useful insights and this will also shed s=
ome<br>
light on the types of things we are trying to get our BMC to do as well as =
our<br>
conceptual approach.<br>
<br>
Also, before anyone says anything, I am aware that Generic Flash Access and=
<br>
Generic Transport Layer are not great names, but we have not thought of any=
thing<br>
better yet. If anyone has any suggestions of better names, or any suggestio=
ns of<br>
any sort, please feel free to share.<br>
<br>
The primary motivation for Generic Flash Access is that there is no generic=
<br>
flash access mechanism that is available to all BMC based systems. LPC base=
d<br>
mailbox is not available on all platforms and thus cannot be the sole basis=
 for<br>
a generic mechanism. Furthermore, we have many types of operations that we =
would<br>
like to do with flash that do not fit well into the mailbox model.<br></blo=
ckquote><div><br></div><div>Definitely the case.=C2=A0 Any approach should =
be something that can be implemented per system.=C2=A0 Such that the data a=
nd the command &amp; control can go over separate channels.=C2=A0 And that =
they don&#39;t imply direct flash access.</div><div><br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
<br>
Generic Flash Access is composed of two parts: the Generic Transport Layer,=
 and<br>
the Generic Flash Access Protocol.<br>
<br>
The Generic Transport Layer (GTL) attempts to provide an abstract stream<br=
>
oriented interface between the BMC and the host CPU. It accomplishes this b=
y<br>
piggy-backing on another pre-existing interface, currently IPMI, however, o=
thers<br>
are possible.<br>
<br>
Conceptually, GTL sort of looks like a net device. A user would open a &quo=
t;socket&quot;;<br>
in this case, would request a transaction id, and then would be able to wri=
te<br>
arbitrary data which would be sent as a request. The request would be route=
d to<br>
a handler on the opposite side which would parse the request and send a<br>
response, which could be then read by the requester. A request may be<br>
initialized by either the BMC or the host.<br>
<br>
GTL is essentially a packetization specification for arbitrary data, with<b=
r>
bindings on other protocols. Given an arbitrary piece of data, GTL breaks t=
he<br>
data up into packets:<br>
<br>
```<br>
struct packet {<br>
=C2=A0 =C2=A0 uint8 transaction_id;<br>
=C2=A0 =C2=A0 uint8 control;<br>
=C2=A0 =C2=A0 uint32 seq;<br>
=C2=A0 =C2=A0 uint8 checksum;<br>
=C2=A0 =C2=A0 uint8 payload[];<br>
};<br>
```<br></blockquote><div><br></div><div>This packet doesn&#39;t have a payl=
oad size.=C2=A0 Also is an 8-bit checksum worthwhile instead of a 16-bit ch=
ecksum?=C2=A0 If the data is sufficiently large, the 8-bit checksum loses a=
 lot of value.</div><div><br></div><div>I&#39;m less worried about the 32-b=
it for the sequence number as that&#39;ll work for quite some time (famous =
last words).=C2=A0 I don&#39;t think it&#39;s worth adding a timestamp fiel=
d as was done to address sequence overflow in TCP.</div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
where `transaction_id` allows packets to be associated with a given transac=
tion<br>
so that multiple transactions can be in progress all at once. The most<br>
significant bit identifies whether the transaction was originated by the ho=
st or<br>
the BMC; if it is unset it is from the host, if it is set, it is from the B=
MC.<br>
In this way, each endpoint only has to keep track of allocations for its<br=
>
transaction IDs.<br>
<br>
`control` is a bit field:<br>
<br>
=C2=A0 * 7:3 reserved for future use<br>
=C2=A0 * 2:0 an enum:<br>
=C2=A0 =C2=A0 - 000 final packet: indicates that it is the last packet in a=
 message.<br>
=C2=A0 =C2=A0 - 001 not final packet: indicates that there are subsequent p=
ackets in the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 message.<br>
=C2=A0 =C2=A0 - 010 retransmit request: requests that all packets after the=
 specified<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 packet, using the seq field, should be r=
esent.<br>
=C2=A0 =C2=A0 - 011 ack: indicates that the last packet for a message was r=
eceived.<br>
=C2=A0 =C2=A0 - 100 invalid state: indicates that a response packet was rec=
eived for a<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unknown request.<br>
=C2=A0 =C2=A0 - 1xx reserved for future use: packets using invalid (reserve=
d) control<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 codes must be silently dropped.<br>
<br>
`seq` is a sequence number that is incremented for each packet, for a retry=
<br>
packet the sequence number is the last packet it received correctly, or 0 i=
f it<br>
has not received the first packet.<br>
<br>
`checksum` is a CRC 8 checksum that includes all of the data of the packet =
with<br>
the exception of itself. If the checksum in a received packet is invalid, t=
he<br>
packet is dropped and a retransmit request with the previous sequence numbe=
r is<br>
sent.<br>
<br>
GTL itself is divided into two layers: the transaction layer and the link l=
ayer.<br>
<br>
The transaction layer is common across all GTL implementations and is<br>
responsible for translating a message (a request or a response) into a seri=
es<br>
of packets and then translating packets back into messages. When the transa=
ction<br>
layer receives a packet, it finds the rx queue associated with the packet&#=
39;s<br>
transaction ID and then checks to see if the packet&#39;s sequence number<b=
r>
immediately follows the previous; if it does, it is added to the queue; if =
not,<br>
it is dropped and a retransmit request is sent with the last sequence numbe=
r it<br>
correctly received or zero if no packets have been received for that<br>
transaction. If the packet is marked &quot;no more data available&quot;, th=
e message is<br>
assembled and passed to the user and an ack is sent. If there is no active<=
br>
transaction for the packet, meaning a response packet was received and ther=
e is<br>
no associated request, an invalid state packet is sent with the same transa=
ction<br>
ID, and sequence number.<br></blockquote><div><br></div><div>Just to verify=
, if you&#39;re sending a 32MB message, I don&#39;t think it&#39;s prudent =
to rebuild the entire message in memory before passing it to the receiving =
end of the &quot;socket.&quot;</div><div><br></div><div>In the prototype im=
plementation design, are you planning on having something effectively call =
&quot;recv&quot; on some library implementing this, with similar semantics =
to Berkeley sockets?</div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
<br>
Sending a packet must follow the above rules. It must retain all packets<br=
>
associated with a message until an ack is sent. If it receives an invalid s=
tate<br>
response, it must cancel the corresponding request, if one exists; it may, =
but<br>
is not required to take additional action. NB: the most likely explanation =
for<br>
an invalid state packet is that the endpoint being communicated with was re=
set.<br>
Other methods of detecting endpoint resets are encouraged and may be used t=
o<br>
cancel requests.<br>
<br>
Although not required for correct functionality, each message will be selec=
ted<br>
according to a round robin strategy from which to send a packet; however,<b=
r>
retransmit, ack, and invalid state packets will always be sent before other=
<br>
packets.<br>
<br>
The link layer is specific to the underlying protocol and is onlg responsib=
le<br>
for exchanging packets between the BMC and the host. For IPMI, the host wil=
l<br>
continually send GTL IPMI OEM requests to the BMC; if there are any packets=
 to<br>
send, the body of the IPMI request will contain the next packet to send as<=
br>
determined by the transaction layer; the BMC will then complete the request=
 with<br>
the next packet as determined by its transaction layer. If either side has<=
br>
nothing to send, the corresponding body will simply be left empty. When the=
 link<br>
layer is sending the final packet in a message; the next packet that it rec=
eives<br>
should be an ACK because ACK packets have higher priority than all other<br=
>
packets; if an ACK was not received, an error occurred and the link layer s=
hould<br>
retransmit the final packet unless requested to retransmit an earlier packe=
t as<br>
directed by a retransmit request.<br></blockquote><div><br></div><div>This =
made sense for me until the messages portion that&#39;s living on top of, b=
ut really next to, or both.=C2=A0 Can you elaborate a use-case more fully w=
ith pseudo-code?</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
<br>
The host&#39;s link layer will issue a GTL IPMI OEM request whenever it has=
 packets<br>
available to send. It must also issue a GTL IPMI OEM request if the respons=
e to<br>
the previous request contained a packet. If neither of these conditions are=
<br>
true, the host will periodically send empty requests to see if the BMC has<=
br>
anything to send. We could also maybe take advantage of `SMS_ATN`, but I do=
 not<br>
think that is important now.<br>
<br>
As I mentioned, the Generic Flash Access Protocol is built on top of GTL: i=
f GTL<br>
is analogous to TCP, GFA is analogous to a REST interface. All it is is a s=
et of<br>
messages mapped to a particular transaction id. GFA is just a set of protoc=
ol<br>
buffer messages:<br></blockquote><div><br></div><div>This comparison is con=
fusing to me.=C2=A0 REST is a layer that is directly tied to data with acti=
ons-driven endpoints.=C2=A0 In the use-case you&#39;re describing, -- well,=
 I&#39;m confused.=C2=A0 I plan to upload the image over mechanism in big d=
ata packets (64KB minus headers), and handle all C2 (command &amp; control)=
 over IPMI OEM.</div><div><br></div><div>In the use-case I&#39;m designing,=
 there is a setup step that precedes being able to even send the data.=C2=
=A0 Is that all handled by the receiver of the messages or should there be =
&quot;ready to send&quot; type messages?</div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
<br>
```<br>
message RawFlashRequest {<br>
=C2=A0 message Read {<br>
=C2=A0 =C2=A0 uint64 offset =3D 1;<br>
=C2=A0 =C2=A0 uint64 size =3D 2;<br>
=C2=A0 }<br>
<br>
=C2=A0 message Write {<br>
=C2=A0 =C2=A0 uint64 offset =3D 1;<br>
=C2=A0 =C2=A0 bytes data =3D 2;<br>
=C2=A0 }<br>
<br></blockquote><div>Per the security of our environment, we are disallowi=
ng direct write to the flash chip itself.=C2=A0 We&#39;ll be staging the im=
age and cryptographically verifying it before flashing it.=C2=A0 Presumably=
 whatever mechanism is parsing and handling the protobufs will handle that =
implementation.</div><div><br></div><div>To send the cryptographic signatur=
e, should a separate mechanism be used, possibly also over GTL, or would th=
is protobuf set be extended?</div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
=C2=A0 message Info {<br>
=C2=A0 }<br>
<br>
=C2=A0 message Checksum {<br>
=C2=A0 =C2=A0 uint64 offset =3D 1;<br>
=C2=A0 =C2=A0 uint64 size =3D 2;<br>
=C2=A0 }<br></blockquote><div><br></div><div>I&#39;m not familiar with prot=
obufs but I don&#39;t a corresponding response to the Checksum request type=
.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0 bytes partition_guid =3D 1;<br>
<br>
=C2=A0 oneof request {<br>
=C2=A0 =C2=A0 Read read =3D 2;<br>
=C2=A0 =C2=A0 Write write =3D 3;<br>
=C2=A0 =C2=A0 Info info =3D 4;<br>
=C2=A0 =C2=A0 Checksum checksum =3D 5;<br>
=C2=A0 }<br>
}<br>
<br>
message RawFlashResponse {<br>
=C2=A0 message Info {<br>
=C2=A0 =C2=A0 bytes guid =3D 1;<br>
=C2=A0 =C2=A0 uint64 block_size =3D 2;<br>
=C2=A0 =C2=A0 uint64 num_blocks =3D 3;<br>
=C2=A0 =C2=A0 bool read_only =3D 4;<br>
=C2=A0 }<br>
<br>
=C2=A0 oneof response {=C2=A0 =C2=A0 =C2=A0 // Empty for Write<br>
=C2=A0 =C2=A0 Info info =3D 1;=C2=A0 =C2=A0 =C2=A0 // from Info<br>
=C2=A0 =C2=A0 bytes data =3D 2;=C2=A0 =C2=A0 =C2=A0// from Read<br>
=C2=A0 =C2=A0 bytes checksum =3D 3; // from Checksum<br>
=C2=A0 }<br>
}<br>
<br>
message PblogRequest {<br>
=C2=A0 message GetBootnum {<br>
=C2=A0 }<br>
<br>
=C2=A0 message WriteEvent {<br>
=C2=A0 =C2=A0 bytes payload =3D 1;<br>
=C2=A0 }<br>
<br>
=C2=A0 message GetRawRegions {<br>
=C2=A0 }<br>
<br>
=C2=A0 oneof request {<br>
=C2=A0 =C2=A0 GetBootnum get_bootnum =3D 1;<br>
=C2=A0 =C2=A0 WriteEvent write_event =3D 2;<br>
=C2=A0 =C2=A0 GetRawRegions get_raw_regions =3D 3;<br>
=C2=A0 }<br>
}<br>
<br>
message PblogResponse {<br>
=C2=A0 oneof response {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Empty for write=
_event<br>
=C2=A0 =C2=A0 uint32 bootnum =3D 1;=C2=A0 =C2=A0 // from GetBootnum<br>
=C2=A0 =C2=A0 bytes raw_regions =3D 2; // from GetRawRegions<br>
=C2=A0 }<br>
}<br>
<br>
message FirmwareUpdateRequest {<br>
=C2=A0 bytes checksum =3D 1;<br>
=C2=A0 bytes payload =3D 2;<br>
}<br>
<br>
message FirmwareUpdateResponse {<br>
}<br>
<br>
message GfaRequest {<br>
=C2=A0 oneof request {<br>
=C2=A0 =C2=A0 RawFlashRequest raw_request =3D 1;<br>
=C2=A0 =C2=A0 PblogRequest pblog_request =3D 2;<br>
=C2=A0 =C2=A0 FirmwareUpdateRequest firmware_update_request =3D 3;<br>
=C2=A0 }<br>
}<br>
<br>
message GfaResponse {<br>
=C2=A0 bool success =3D 1;<br>
=C2=A0 string error =3D 2; // Set when success =3D=3D false<br>
<br>
=C2=A0 oneof response {<br>
=C2=A0 =C2=A0 RawFlashResponse raw_response =3D 3;<br>
=C2=A0 =C2=A0 PblogResponse pblog_response =3D 4;<br>
=C2=A0 =C2=A0 FirmwareUpdateResponse firmware_update_response =3D 5;<br>
=C2=A0 }<br>
}<br>
```=C2=A0<br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
Unlike GTL, which is a strictly defined protocol, the above GFA messages ar=
e<br>
more of a suggestion of operations that would be provided. The reason we ch=
ose<br>
protobufs is that protobufs, are an efficient encoding, and more importantl=
y<br>
that they are extensable.</blockquote><div>=C2=A0</div><div>Are protobufs s=
ufficiently widely accepted that using them here is worthwhile?=C2=A0 I don=
&#39;t see anything in the structures that can&#39;t be equally compactly r=
epresented via normal data structures, and are just as extensible.<br></div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The rea=
son that this is so important is that a flash<br>
chip is likely to have multiple partitions that each have its own security<=
br>
policy; for example, a CPU flash chip is likely to have a firmware image, w=
hich<br>
should only be updated with cryptographically signed updates, but it will a=
lso<br>
have an NVRAM variable section, which depending on the BIOS implementation =
could<br>
have variables that could effect the security of the BIOS and they may not;=
 we<br>
also have our own system event log called PBLog; most would probably not be=
<br>
interested in this, but it is a good example of a message type that the hos=
t<br>
should be able to send us at anytime and the only policy we would likely ha=
ve is<br>
rate limiting.<br>
<br>
In addition to allowing easy modification to meet the needs of different<br=
>
systems, using a mechanism that readily allows modification means that the<=
br>
protocol can be updated and can evolve over time.<br>
<br>
In summary, the only required messages are GfaRequest and GfaResponse, whic=
h can<br>
be modified to support arbitrary functionality.<br>
<br>
On a side note, all of the mechanisms provided above can be used to impleme=
nt<br>
other arbitrary protocols; for example, we have implemented I2C passthrough=
<br>
using raw IPMI OEM messages, which have some short comings due to the lengt=
h<br>
restrictions of IPMI messages; using the above mechanisms, GTL with protobu=
fs,<br>
implementing I2C passthrough would be very easy. The possibility of impleme=
nting<br>
other protocols beyond GFA is why I decided to support multiple concurrent<=
br>
transactions.<br>
<br>
We are planning on implementing GTL within the kernel as its own framework.=
 The<br>
IPMI based link layer implementation is intended to be implemented on top o=
f the<br>
BMC side IPMI framework I have been discussing with Corey. I think my decis=
ion<br>
to put it here is intuitive since it is really supposed to be a hardware<br=
>
abstraction of sorts, but we can discuss it if it is not obvious.<br>
<br>
Currently, GFA has a userland tool to be used from the host and a BMC side<=
br>
daemon. The daemon is mostly complete; the tool is basically a wrapper arou=
nd<br>
the protobufs listed above, so there is not much to do.<br>
<br>
Cheers!<br>
</blockquote></div><br></div></div>

--001a113da99a4faa7205592998df--
