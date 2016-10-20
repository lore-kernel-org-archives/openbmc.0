Return-Path: <brendanhiggins@google.com>
Received: from mail-yw0-x229.google.com (mail-yw0-x229.google.com
 [IPv6:2607:f8b0:4002:c05::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t0JYw5frHzDvY0
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 06:20:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=VBaepKgH; 
 dkim-atps=neutral
Received: by mail-yw0-x229.google.com with SMTP id u124so68158916ywg.3
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 12:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
 bh=LfCwHsFUDwEyMrXsdyd0VO5eKJ+L3cNIdgDjDnr+in8=;
 b=VBaepKgH2t96goSKo01okAJEChOoFqGfh1MUHBE07cMYwiOoOKeBMIGh/8CTNHLtCw
 A2XdNwrBY0nkth8fyURkDiiSeqPIrrfpUaqNHVJ2hNI1yOU1GzaMw88wLQuoTlB/B3IR
 YOuR0VlteCZnZwX/X8E04Ui6X3mjcRC8kMO8GQwT8BvRWIEJM9UfcJxl+nllJ9sWHYoA
 JTP6MFeHHq7xvJjaAx9LMT9Ej11BiBpDVS9si3PNEVWo2bmw8+SjgYQ8vxrhe+skpfH4
 5HygYcOBUrFlK1pbMlF8fOUiYi7czXMZRpkUpmWv3FEo2sTYXB6a0A6s+2x5/FuPga0/
 3nxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to;
 bh=LfCwHsFUDwEyMrXsdyd0VO5eKJ+L3cNIdgDjDnr+in8=;
 b=So7+Six8TwOWvX8zQzURFgMK8ITn1hPMT7y+mpdIVu6MDhNViMJ2xp56uEFC47ppJp
 fr2l/xRay45FL8qY5TL9saxbQb55PD55tHG4a4V1DlZIepE0R5UP3TF0Sho50cWnCQmr
 O23LbNcZrVy1WrZp1nPL7nFfaU3TGe3P9hdQAzh3Ic/DdT7n8/EcKHTH0uqHwcPWoxVv
 UGR+0JhAlD+X/8HZgaIQHvJ6YZdUn5QWyy7eu26Rp+gY9xwN1u484BlxmDsS9+AZThKv
 2/YKQ5hRYKt4wv3apVItQ61NzBBCRC58rRaguPl6faUms7UI74U6VgTVGgBgWK6r/LXQ
 ANpA==
X-Gm-Message-State: AA6/9RkjaYuvlFSjo2Zd3Qr4USv5leO3/M7aHlX5NbV1Kkys8hWlhyGe0VHH0JGTh64FPpGtCT4uhYn47pjxB5v5
X-Received: by 10.13.204.216 with SMTP id o207mr3090610ywd.16.1476989590381;
 Thu, 20 Oct 2016 11:53:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.36.10 with HTTP; Thu, 20 Oct 2016 11:53:09 -0700 (PDT)
In-Reply-To: <1476910490-21190-1-git-send-email-brendanhiggins@google.com>
References: <1476173448.2654.7.camel@kernel.crashing.org>
 <1476910490-21190-1-git-send-email-brendanhiggins@google.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Thu, 20 Oct 2016 11:53:09 -0700
Message-ID: <CAFd5g44v88KZfNDLH5X_Qt0NTJ9bq_8aRuG14MoZN9gfa_rTsQ@mail.gmail.com>
Subject: Fwd: libflash questions mostly relating to P9 bringup
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 20 Oct 2016 19:20:53 -0000

Sorry forgot to include the OpenBMC mail list.


---------- Forwarded message ----------
From: Brendan Higgins <brendanhiggins@google.com>
Date: Wed, Oct 19, 2016 at 1:54 PM
Subject: libflash questions mostly relating to P9 bringup
To: cyrilbur@gmail.com, joel@jms.id.au, xow@google.com, benh@kernel.crashing.org
Cc: Brendan Higgins <brendanhiggins@google.com>


> I dont know if that was mentioned earlier in the thread but we are
> working on a mailbox based protocol for flash access to avoid accessing
> the flash controller registers from any other entity than the BMC, in
> order to be able to cut off the iLPC->AHB backdoor completely.
>
> This should support having the flash either access directly for reads
> or via an in-memory image in the BMC (aka memboot) and writes will be
> done to an in-memory window on the LPC and "committed" to flash via
> mbox commands.
>
> We can get you details when we have a bit more sorted out on our side,
> hopefully in a few days.

We are also working on a flash access protocol except ours is via IPMI; this is
was a motivating reason for the 0-N response per request extension discussed
here: https://lists.ozlabs.org/pipermail/openbmc/2016-September/004523.html

The main desire for using IPMI for this is that IPMI is the closest thing we
have to a common communication protocol between the BMC and the primary CPU
across platforms. Some platforms, for example, may not have support for LPC or
eSPI.

Our plan is to implement this as an OEM/Group extension with the payload as a
Protocol Buffer encoded (see
https://developers.google.com/protocol-buffers/docs/encoding) header:

message PacketHeader {
  optional uint32 packet_idx = 1;
  optional uint32 packet_count = 2;
}

followed by a chunk of data with whatever space remains. So the actual message
would look something like:

struct Packet {
  PacketHeader header;
  char data[X];
};

where X is IPMI payload size - PacketHeader size. This is not a valid struct
definition as the fields have variable offsets and size, and is only meant for
illustrative purposes.

The motivation behind the protobuf encoding is that it can be extended in a
backwards compatible way and that unneeded fields (for example, we may only want
to report the packet_count, the number of expected packets, in the first
message) only take up space if they are sent; similarly, numeric fields use
varint encoding so that the value takes up less space if it is small.

The actual flash access message would be reassembled from multiple packets and
could contain different messages, for example:

message RawFlashRequest {
  enum RequestType {
    Read = 0;
    Write = 1;
    Info = 2;
    Checksum = 3;
  }

  optional RequestType type = 1;
  optional bytes partition_guid = 2;
  optional uint32 offset = 3;
  optional uint32 size = 4;
  repeated bytes payload = 5;
}

could be one message type.

This is not intended to be a complete specification, but an overview of what we
are working on and what our needs are. I think it would be preferential if we
could have a common implementation.

Cheers.

---------- Forwarded message ----------
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Date: Wed, Oct 19, 2016 at 5:15 PM
Subject: Re: libflash questions mostly relating to P9 bringup
To: Brendan Higgins <brendanhiggins@google.com>, cyrilbur@gmail.com,
joel@jms.id.au, xow@google.com


On Wed, 2016-10-19 at 13:54 -0700, Brendan Higgins wrote:

> We are also working on a flash access protocol except ours is via IPMI; this is
> was a motivating reason for the 0-N response per request extension discussed
> here: https://lists.ozlabs.org/pipermail/openbmc/2016-September/004523.html
>
> The main desire for using IPMI for this is that IPMI is the closest thing we
> have to a common communication protocol between the BMC and the primary CPU
> across platforms. Some platforms, for example, may not have support for LPC or
> eSPI.

 .../...

We chose do to something a bit different for several reasons.

The main one is probably speed. IPMI is fairly slow and we don't really want
to transport the actual flash data over it.

So the idea is to read/write through the LPC FW space, by mapping it to a
region of BMC memory rather than flash, and send commands via a separate
IO channel (which could be IPMI, though in our current prototype it's not)
to "commit" the modified portions.

It's a bit more convoluted as we plan to support a sliding write window
that might be distinct from the read window as to not require using as
much BMC memory as the size of the flash, but we haven't implemented all
of the "options" yet.

It will also give us memboot for free, ie, the ability to boot from an
image of the flash coming from the network rather than flash which is useful
for development, and using memory rather than flash seems to speed things
up a bit as well.

It might not be portable to different BMCs, so having the IPMI method as
some kind of fallback might still be an options for us though, we should
probably look into it.

The other reason, which granted isn't a terribly good one, is that HostBoot
has their flash layer in their "kernel" while their IPMI stack is in their
"User space", and they are reluctant on changing that.

That being said, we could use the second BT interface along with a massively
stripped down IPMI stack in their kernel to keep the flash path separate from
the main IPMI path if we wanted.

For now, we use the mbox instead which is slightly easier to use than BT and
avoids all "conflicts" with the IPMI traffic.

Antoher advantage in segregating these is that we open the possibility of
assigning the main iBT interface directly to linux instead of OPAL, taking
OPAL out of the path of normal IPMI messages. OPAL <-> BMC would then use
our mbox sideband (but could use the secondary BT if we wanted to, it's just
inconvenient as it doesn't support interrupts in the Aspeed hardware).

Cheers,
Ben.


---------- Forwarded message ----------
From: Brendan Higgins <brendanhiggins@google.com>
Date: Thu, Oct 20, 2016 at 11:41 AM
Subject: Re: libflash questions mostly relating to P9 bringup
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Cyril Bur
<cyrilbur@gmail.com>, Joel Stanley <joel@jms.id.au>, Xo Wang
<xow@google.com>, Abhishek Pandit <abhishekpandit@google.com>


> The main one is probably speed. IPMI is fairly slow and we don't really want
>
>  to transport the actual flash data over it.


I do not dispute that; I think we accept that as a consequence, again,
as LPC does not exist on many platforms.

> It's a bit more convoluted as we plan to support a sliding write window
> that might be distinct from the read window as to not require using as
> much BMC memory as the size of the flash, but we haven't implemented all
> of the "options" yet.


I only mentioned the most simple method that we wanted to implement,
RawFlashRequest, which would provide direct flash access, but we were
interested in supporting other methods as well, so if you would be
willing to support other access methods, I see this as being totally
compatible with what we want to do.

> It might not be portable to different BMCs, so having the IPMI method as
> some kind of fallback might still be an options for us though, we should
> probably look into it.


That sounds reasonable to me. As long as we have a common way to do
flash access on all systems we are happy; if we happen to support some
other faster access methods (as long as they share a common API), I
think that would be even better :-)

> For now, we use the mbox instead which is slightly easier to use than BT and
> avoids all "conflicts" with the IPMI traffic.


Yep, that is what we are trying to address with our OEM/Group
extension; it provides an interface that sends arbitrary data over
IPMI. Admittedly, it will make all other IPMI traffic slower; however,
this is unavoidable on platforms that only have one hardware interface
between the BMC and the host CPU.

>
> Antoher advantage in segregating these is that we open the possibility of
> assigning the main iBT interface directly to linux instead of OPAL, taking
> OPAL out of the path of normal IPMI messages. OPAL <-> BMC would then use
> our mbox sideband (but could use the secondary BT if we wanted to, it's just
> inconvenient as it doesn't support interrupts in the Aspeed hardware).


Also true, but still unavoidable if we only have a single hardware interface.

Sounds to me like we do not have any incompatible goals; although it
is true that on our side we are more concerned about a common
implementation that will work on any platform and you guys seem to be
more concerned about performance, I think that just means that we
should provide both transport layers: IPMI and LPC mailbox. I imagine
that a good deal of the actual flash access logic will be the same for
the both of us.

Cheers
