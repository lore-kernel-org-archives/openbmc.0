Return-Path: <brendanhiggins@google.com>
Received: from mail-qt0-x22c.google.com (mail-qt0-x22c.google.com
 [IPv6:2607:f8b0:400d:c0d::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xbmdN3ljMzDqXj
 for <openbmc@lists.ozlabs.org>; Tue, 22 Aug 2017 07:13:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="vrGZrg3b"; 
 dkim-atps=neutral
Received: by mail-qt0-x22c.google.com with SMTP id z10so9013484qtz.1
 for <openbmc@lists.ozlabs.org>; Mon, 21 Aug 2017 14:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=UdFWq9MC44cdAN29a73QAdI8EIb3oJupJyUgULnAUq8=;
 b=vrGZrg3btwBGUMB7Yid/JRShSSN5P3m0slLfkb42sTZUO3eLbRBPxPlVj4mIPL8LKn
 g4jRTPHI7A45S0LUGE1AMqLdGrTt7Cy6O7O0NxA3S/k4O5ZYIp2dxsyWXbfl//rbf+qx
 2xvMDc9B4THU56hk05TZQ7GkXy7zyToO3Q9Zk9+f70b5Up57O8hZ7rROTzoTJXVIPe0B
 545zUD2nzp7nEZaPQIeE+bNmjwCsIxi22sAYz26yBMZbJfFWPaABrfDTW0m1x+PFFsrp
 5BPUjXm9GZHy3T/lO2YQNNjKx4aBLJ01FuoDcdsk5tsSk+2wqUAp1EqZ42ERqKA2429m
 gFgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=UdFWq9MC44cdAN29a73QAdI8EIb3oJupJyUgULnAUq8=;
 b=mAkFrzlb+Hg2AZH3yH/qctL9qlfDVkidkda29WY0rPdQ2u6F9oPSjpjln2WToq7VFC
 tUYLMnutjaQIQBFVx4F3G8/h35VoDtAjUUpNFFvPe4CBAdGhZdUlA8puqqdYEtMsG7la
 ZHTWupusjziOLi/sWgkjAyYcyF9TI61PoH2lvbgMFrsU/KLHgPagz3OCSHEgYditZsLQ
 ENtXYwT2pjqAbQyKz815MM0fykJkCJ9riKvCm6+wXOcGUg0yLijq300Rza5CPLFF+K2a
 qN1Pa1GtXTSWivLJvcijIgci80LmWpvL1HbqSYgeOElFf2E4yJIB6R9AvpojsCYnxyyH
 t+6w==
X-Gm-Message-State: AHYfb5iHaqufq1iah3G64ye8h8FBSw7LVGDcqSwpA/sUijMUHsckqKWd
 E1f7MLl/U0EittmrW0TZ69laEeDhjs1WekYxIQ==
X-Received: by 10.237.47.97 with SMTP id l88mr5208024qtd.172.1503350021356;
 Mon, 21 Aug 2017 14:13:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.181 with HTTP; Mon, 21 Aug 2017 14:13:40 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
Date: Mon, 21 Aug 2017 14:13:40 -0700
Message-ID: <CAFd5g461uDs=is_W9-fSX=kWfMER-hS-auMoEPBDYJ6BWo6gwQ@mail.gmail.com>
Subject: Generic Flash Access
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Nancy Yuen <yuenn@google.com>,
 Kun Yi <kunyi@google.com>, Corey Minyard <minyard@acm.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 21 Aug 2017 21:13:45 -0000

Hello all,

Nancy has informed me that there is some renewed interest in our Generic Flash
Access mechanism and I know people have been asking for it for a while now,
here it finally is!

Our design has evolved quite a bit since it was originally shared (original
proposal can be found here
https://lists.ozlabs.org/pipermail/openbmc/2016-October/005131.html for anyone
interested), so I think it makes sense to start from scratch.

I decided to add Corey Minyard, the Linux IPMI maintainer on this email as well
because I think he will have some useful insights and this will also shed some
light on the types of things we are trying to get our BMC to do as well as our
conceptual approach.

Also, before anyone says anything, I am aware that Generic Flash Access and
Generic Transport Layer are not great names, but we have not thought of anything
better yet. If anyone has any suggestions of better names, or any suggestions of
any sort, please feel free to share.

The primary motivation for Generic Flash Access is that there is no generic
flash access mechanism that is available to all BMC based systems. LPC based
mailbox is not available on all platforms and thus cannot be the sole basis for
a generic mechanism. Furthermore, we have many types of operations that we would
like to do with flash that do not fit well into the mailbox model.

Generic Flash Access is composed of two parts: the Generic Transport Layer, and
the Generic Flash Access Protocol.

The Generic Transport Layer (GTL) attempts to provide an abstract stream
oriented interface between the BMC and the host CPU. It accomplishes this by
piggy-backing on another pre-existing interface, currently IPMI, however, others
are possible.

Conceptually, GTL sort of looks like a net device. A user would open a "socket";
in this case, would request a transaction id, and then would be able to write
arbitrary data which would be sent as a request. The request would be routed to
a handler on the opposite side which would parse the request and send a
response, which could be then read by the requester. A request may be
initialized by either the BMC or the host.

GTL is essentially a packetization specification for arbitrary data, with
bindings on other protocols. Given an arbitrary piece of data, GTL breaks the
data up into packets:

```
struct packet {
    uint8 transaction_id;
    uint8 control;
    uint32 seq;
    uint8 checksum;
    uint8 payload[];
};
```

where `transaction_id` allows packets to be associated with a given transaction
so that multiple transactions can be in progress all at once. The most
significant bit identifies whether the transaction was originated by the host or
the BMC; if it is unset it is from the host, if it is set, it is from the BMC.
In this way, each endpoint only has to keep track of allocations for its
transaction IDs.

`control` is a bit field:

  * 7:3 reserved for future use
  * 2:0 an enum:
    - 000 final packet: indicates that it is the last packet in a message.
    - 001 not final packet: indicates that there are subsequent packets in the
          message.
    - 010 retransmit request: requests that all packets after the specified
          packet, using the seq field, should be resent.
    - 011 ack: indicates that the last packet for a message was received.
    - 100 invalid state: indicates that a response packet was received for a
          unknown request.
    - 1xx reserved for future use: packets using invalid (reserved) control
          codes must be silently dropped.

`seq` is a sequence number that is incremented for each packet, for a retry
packet the sequence number is the last packet it received correctly, or 0 if it
has not received the first packet.

`checksum` is a CRC 8 checksum that includes all of the data of the packet with
the exception of itself. If the checksum in a received packet is invalid, the
packet is dropped and a retransmit request with the previous sequence number is
sent.

GTL itself is divided into two layers: the transaction layer and the link layer.

The transaction layer is common across all GTL implementations and is
responsible for translating a message (a request or a response) into a series
of packets and then translating packets back into messages. When the transaction
layer receives a packet, it finds the rx queue associated with the packet's
transaction ID and then checks to see if the packet's sequence number
immediately follows the previous; if it does, it is added to the queue; if not,
it is dropped and a retransmit request is sent with the last sequence number it
correctly received or zero if no packets have been received for that
transaction. If the packet is marked "no more data available", the message is
assembled and passed to the user and an ack is sent. If there is no active
transaction for the packet, meaning a response packet was received and there is
no associated request, an invalid state packet is sent with the same transaction
ID, and sequence number.

Sending a packet must follow the above rules. It must retain all packets
associated with a message until an ack is sent. If it receives an invalid state
response, it must cancel the corresponding request, if one exists; it may, but
is not required to take additional action. NB: the most likely explanation for
an invalid state packet is that the endpoint being communicated with was reset.
Other methods of detecting endpoint resets are encouraged and may be used to
cancel requests.

Although not required for correct functionality, each message will be selected
according to a round robin strategy from which to send a packet; however,
retransmit, ack, and invalid state packets will always be sent before other
packets.

The link layer is specific to the underlying protocol and is onlg responsible
for exchanging packets between the BMC and the host. For IPMI, the host will
continually send GTL IPMI OEM requests to the BMC; if there are any packets to
send, the body of the IPMI request will contain the next packet to send as
determined by the transaction layer; the BMC will then complete the request with
the next packet as determined by its transaction layer. If either side has
nothing to send, the corresponding body will simply be left empty. When the link
layer is sending the final packet in a message; the next packet that it receives
should be an ACK because ACK packets have higher priority than all other
packets; if an ACK was not received, an error occurred and the link layer should
retransmit the final packet unless requested to retransmit an earlier packet as
directed by a retransmit request.

The host's link layer will issue a GTL IPMI OEM request whenever it has packets
available to send. It must also issue a GTL IPMI OEM request if the response to
the previous request contained a packet. If neither of these conditions are
true, the host will periodically send empty requests to see if the BMC has
anything to send. We could also maybe take advantage of `SMS_ATN`, but I do not
think that is important now.

As I mentioned, the Generic Flash Access Protocol is built on top of GTL: if GTL
is analogous to TCP, GFA is analogous to a REST interface. All it is is a set of
messages mapped to a particular transaction id. GFA is just a set of protocol
buffer messages:

```
message RawFlashRequest {
  message Read {
    uint64 offset = 1;
    uint64 size = 2;
  }

  message Write {
    uint64 offset = 1;
    bytes data = 2;
  }

  message Info {
  }

  message Checksum {
    uint64 offset = 1;
    uint64 size = 2;
  }

  bytes partition_guid = 1;

  oneof request {
    Read read = 2;
    Write write = 3;
    Info info = 4;
    Checksum checksum = 5;
  }
}

message RawFlashResponse {
  message Info {
    bytes guid = 1;
    uint64 block_size = 2;
    uint64 num_blocks = 3;
    bool read_only = 4;
  }

  oneof response {      // Empty for Write
    Info info = 1;      // from Info
    bytes data = 2;     // from Read
    bytes checksum = 3; // from Checksum
  }
}

message PblogRequest {
  message GetBootnum {
  }

  message WriteEvent {
    bytes payload = 1;
  }

  message GetRawRegions {
  }

  oneof request {
    GetBootnum get_bootnum = 1;
    WriteEvent write_event = 2;
    GetRawRegions get_raw_regions = 3;
  }
}

message PblogResponse {
  oneof response {         // Empty for write_event
    uint32 bootnum = 1;    // from GetBootnum
    bytes raw_regions = 2; // from GetRawRegions
  }
}

message FirmwareUpdateRequest {
  bytes checksum = 1;
  bytes payload = 2;
}

message FirmwareUpdateResponse {
}

message GfaRequest {
  oneof request {
    RawFlashRequest raw_request = 1;
    PblogRequest pblog_request = 2;
    FirmwareUpdateRequest firmware_update_request = 3;
  }
}

message GfaResponse {
  bool success = 1;
  string error = 2; // Set when success == false

  oneof response {
    RawFlashResponse raw_response = 3;
    PblogResponse pblog_response = 4;
    FirmwareUpdateResponse firmware_update_response = 5;
  }
}
```

Unlike GTL, which is a strictly defined protocol, the above GFA messages are
more of a suggestion of operations that would be provided. The reason we chose
protobufs is that protobufs, are an efficient encoding, and more importantly
that they are extensable. The reason that this is so important is that a flash
chip is likely to have multiple partitions that each have its own security
policy; for example, a CPU flash chip is likely to have a firmware image, which
should only be updated with cryptographically signed updates, but it will also
have an NVRAM variable section, which depending on the BIOS implementation could
have variables that could effect the security of the BIOS and they may not; we
also have our own system event log called PBLog; most would probably not be
interested in this, but it is a good example of a message type that the host
should be able to send us at anytime and the only policy we would likely have is
rate limiting.

In addition to allowing easy modification to meet the needs of different
systems, using a mechanism that readily allows modification means that the
protocol can be updated and can evolve over time.

In summary, the only required messages are GfaRequest and GfaResponse, which can
be modified to support arbitrary functionality.

On a side note, all of the mechanisms provided above can be used to implement
other arbitrary protocols; for example, we have implemented I2C passthrough
using raw IPMI OEM messages, which have some short comings due to the length
restrictions of IPMI messages; using the above mechanisms, GTL with protobufs,
implementing I2C passthrough would be very easy. The possibility of implementing
other protocols beyond GFA is why I decided to support multiple concurrent
transactions.

We are planning on implementing GTL within the kernel as its own framework. The
IPMI based link layer implementation is intended to be implemented on top of the
BMC side IPMI framework I have been discussing with Corey. I think my decision
to put it here is intuitive since it is really supposed to be a hardware
abstraction of sorts, but we can discuss it if it is not obvious.

Currently, GFA has a userland tool to be used from the host and a BMC side
daemon. The daemon is mostly complete; the tool is basically a wrapper around
the protobufs listed above, so there is not much to do.

Cheers!
