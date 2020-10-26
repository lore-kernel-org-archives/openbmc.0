Return-Path: <SRS0=h6B3=EB=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2BD8C388F7
	for <openbmc@archiver.kernel.org>; Mon, 26 Oct 2020 02:05:24 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CF8B2222C
	for <openbmc@archiver.kernel.org>; Mon, 26 Oct 2020 02:05:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aj.id.au header.i=@aj.id.au header.b="ULcEx9i5";
	dkim=temperror (0-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="j5ECWjID"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CF8B2222C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CKJ806yJszDqMM
	for <openbmc@archiver.kernel.org>; Mon, 26 Oct 2020 13:05:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=ULcEx9i5; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=j5ECWjID; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CKJ586cCgzDqLv
 for <openbmc@lists.ozlabs.org>; Mon, 26 Oct 2020 13:02:51 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 9CF8D5C00D2;
 Sun, 25 Oct 2020 22:02:48 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sun, 25 Oct 2020 22:02:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=N0f8XP3fFTWeFcBHrIJeZixJ6aL39n6
 ZABJ5dk8thaU=; b=ULcEx9i57YVtJY5G9ypDqmOcu1s+0uI4Ex//yajJ1OXlncP
 DGDwUkapoSaVomTEfXlv1T1+3Fu2L6swGsPYd276e6AZvM0+kjNd5ADF3Oy54WHg
 qLDmZzrqNWw+b6UoxYdJfRMyYvlKZXIVSmxstG1ANtkaxaB/vBAZUKEZ63CTWWMi
 O7cpLuhXyEcERtiMsUPtBS5o/AvxiG9j9i8CjkZGJbuoxXj9bfqTQzdkGyQ0fYcx
 Pm3sVhbwCgZ7bZ9p+R9vfZaIih6EhEHgGy8b8HaZgxcUDiwDjFNM4y0vj9HVYHeZ
 HVF2O3HQzrQVMPytXTmbdPfjBM261CP+gwa6BgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=N0f8XP
 3fFTWeFcBHrIJeZixJ6aL39n6ZABJ5dk8thaU=; b=j5ECWjIDdfCwr8VRIC5GtU
 UQ7BudcVH7fjUv0twVM9pkJFMSgQjzll2qVZAmugqXaPp91lLlvMNIk8j7BJ1mVx
 1hfSSc6LP+YQo6fbWVRm92z3y2E3mURIc7Hwlf66ddisUyXt5vE7jdps/bNMXVno
 Bzd7BdW+sKu5sRS+V8t+PAJLfSdMeqg3uyND7ik+jczkOa9zIlQgkwN/0MMdKoYL
 QoN+yXkDiq3aKpzGWxVxQI/A/kbVX/0+CiS2TOSeiqD+aKiLT+fZXjli/1/Xyaaw
 OP9C1kVKaq9FNlL9ppq+TBnX+uk+4uvqZicsi3wbGcAF9PFqHZqJ8dPDajO1dPxQ
 ==
X-ME-Sender: <xms:SC6WX1AVavqtKhUYmlnl-SCJvhzDLbZvsi_ow53AF8ZZfMQNgxymaQ>
 <xme:SC6WXzgPBzyeYSR7d4w9QGUL1m5gUiY4UD0vU0WaZ5OS6npWEtIHBjgpkkxafAezc
 s_0Biglz7cGegX-Dw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrkeehgdegfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:SC6WXwkjrnVxc6LDPbrVVNKaATFOVIHRMiIKBCUJiYLZBKD5QJcdLw>
 <xmx:SC6WX_xszu1cyZRdjHEukFMehjZq6-EM8QND1ZKgpFZOh4l48e5i5Q>
 <xmx:SC6WX6STYvMlzXXoLXABFd-Y_bMr-e_4syHM6k5ca_ovVk94GiaKuw>
 <xmx:SC6WX1fx5ojQOZuh8prYh1KP6tCM3mbeYTY1j8grMpalHCLfOWsUbw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 6424FE050C; Sun, 25 Oct 2020 22:02:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-529-g69105b1-fm-20201021.003-g69105b13
Mime-Version: 1.0
Message-Id: <5bc5676b-d00c-49e4-b1c6-70da0d81bc0a@www.fastmail.com>
In-Reply-To: <CA+-TXo_C3pP=5zn+O7dtP4wHu9JwhubdUC6aqSMK_J742Cpkaw@mail.gmail.com>
References: <CA+-TXo_C3pP=5zn+O7dtP4wHu9JwhubdUC6aqSMK_J742Cpkaw@mail.gmail.com>
Date: Mon, 26 Oct 2020 12:32:27 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Pasha Ghabussi" <pashag@google.com>, openbmc@lists.ozlabs.org
Subject: Re: BMC Performance Profiler
Content-Type: text/plain
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
Cc: Ed Tanous <edtanous@google.com>, Sui Chen <suichen@google.com>,
 Ofer Yehielli <ofery@google.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>


> Requirements and Scalability:
> 
>  * Should provide the adequate functionalities to filter, visualize the 
> events timeline, and group the DBus traffic based on multiple criteria 
> such as type, source, destination, path, interface, demon signatures, 
> and more.

Probably the most common thing I've used dbus-pcap for is finding ugly latencies in long IPC call chains (i.e. more than one hop). This, among other insane ideas (boot process simulation via IPMI message replay), was the motivation for writing it.

Probably the most useful thing I've implemented in dbus-pcap (aside from the general filtering capabilities) was method call tracking. A harder problem is identifying complete call trees in the message timeline (filtering out unrelated messages). Generally this requires a bunch of manual work with getting the filters right in the dbus-pcap invocation, as it requires knowledge of the implementation of each daemon. Did you have any ideas for making this easier? My brief thought is to recursively identify the service targeted by a method call and to track calls from this service until it sends the reply message to the caller, though this gets messier with ASIO-based daemons.

Andrew
