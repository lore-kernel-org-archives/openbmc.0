Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ZYMyLMzJ"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="QK9ExMOR"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44fpp864pLzDqPS
 for <openbmc@lists.ozlabs.org>; Thu, 11 Apr 2019 15:03:43 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5C87221B30;
 Thu, 11 Apr 2019 01:03:40 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 11 Apr 2019 01:03:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:date:from:to:cc:subject:content-type; s=
 fm2; bh=jlwRrmn5UnbT89LyMJZ+9z/syBSMTnA8PRR3CKsXQIE=; b=ZYMyLMzJ
 OP2CfHgaTwinFWedORrIVf8154Mz0KArw/N8YELUQle+zFMQ3NXC/jNzTce2vLLB
 FgZGfz0gM3UIbtH5iVR39s4OuNV8Ha4kykRFuybf2u6B8pV0Y80D0ZCxOzlaf/PD
 J/x3LINbCfa3ez+Tf/8QXxqL7/XV8v2N7yI4mKiU5jF9QlwR6EJQRYQS+dgcJmH4
 cJfgiLvD0u5VJI+pxENJQBECov2gmB1E9T8grbLTKT6ESuDPjNyvupxSkzD6W8OL
 8uY4rHOqr3mo05GN3gv1reVjGziACA5EZwa5l4n1yOwfR6r/po1hpsIwFDwKWWfw
 B0VDAXhPcFvbaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=jlwRrmn5UnbT89LyMJZ+9z/syBSMT
 nA8PRR3CKsXQIE=; b=QK9ExMORpO+NCdzXFDiAExjEqppsXtx/VF5xnzR+fA37h
 md33cQbH/zKrNv5LNenY6RptIOCh7mmYBOgOUeXcncEbz5WS6RUQwq1wAcb+UH4Y
 RrY3DbvW3mYCnixC3zMdu3bvPTXzMj3xvviMxH93vjY5TdwJCZDdkZRdGE7b9D7b
 sh4wFVHsawwRJDiSUAF7ls7rRyKFTuLn1Nwho0vE5Ws/yAUzLauEX+QdA+jq6fZm
 PaCCInbHU+GrbrkassoL0YBJAewqdcwloKUpYztndhzFxxSuq6BD7RKvv59dI9+I
 8uaSnu+KsIi6PbWS4+eptsbR0Mo6oIhPvo7FyaLgg==
X-ME-Sender: <xms:q8quXLXUNNnuoeeEdOeDGJpFeIYn1hSgnfTbE52EFi7bMzjsWJpTpA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudekgdekhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculddvfedmnecujfgurhepofgfggfkfffhvffutgesthdtredtreerjeen
 ucfhrhhomhepfdetnhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrih
 gurdgruheqnecuffhomhgrihhnpehophgvnhgsmhgtqdhprhhojhgvtghtrdighiiinecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluh
 hsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:rMquXACwBOMD-R2NjN0p7-iddHF4Z2k7KbX7dT89fMfQGEb_Do-RLQ>
 <xmx:rMquXOo6_Sm1kWyzTi_mbxQe9jLK1cu78H03ziJJswnd1XTEl4hK1Q>
 <xmx:rMquXM1tzVwmymXu62bfj3hzxMm7iQzC2U6FipRZUf5Lwf7uQlgv6A>
 <xmx:rMquXJJdiKP7xvul9_weTPK7I0QAqFSp7zlgEn5kudB08_umFJEbbQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E212A7C131; Thu, 11 Apr 2019 01:03:39 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-329-gf4aae99-fmstable-20190329v1
Mime-Version: 1.0
X-Me-Personality: 52947553
Message-Id: <cd75d086-fdc0-4c83-8094-c3b802f6ad37@www.fastmail.com>
Date: Thu, 11 Apr 2019 01:02:23 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Cc: "Brad Bishop" <bradleyb@fuzziesquirrel.com>,
 "Andrew Geissler" <geissonator@gmail.com>, wak@google.com
Subject: =?UTF-8?Q?Using_D-Bus_well-known_service_names_and_deprecating_mapper_se?=
 =?UTF-8?Q?rvice_lookups?=
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
X-List-Received-Date: Thu, 11 Apr 2019 05:03:48 -0000

Hello,

Recently Andrew Geissler, William and myself have been running into limitations of the mapper's service lookups. In my opinion we should move to use well known service names and avoiding reliance on the mapper to determine who to talk to.

My issues with using the mapper for service dependencies are:

1. Ambiguities in the way `mapper wait` functions
2. Race conditions between bus name announcement, mapper introspection and inbound service lookups
3. Increased IPC traffic (decreasing performance).

Expanding on 1, `mapper wait` takes a path name argument and waits until the path is available on a bus connection. The problem here is that multiple connections can (and do) implement objects under a given path, so the successful exit of `mapper wait` with the expectation that a given service is available can be an undefined result, as it's possible the *wrong* service was used to resolve the wait.

Where this hits home is that we currently have a systemd service, mapper-wait@.service, that allows units to depend on the presence of a service providing a required path. With the ambiguity outlined above it's possible that dependent services are started earlier than they should be due to `mapper wait` falsely exiting success with respect to the dependent's actual requirement.

A quick grep of the openbmc tree gives an idea of the potential problem size:

$ git ls-files -- recipes-phosphor/ | grep '\.service$' | wc -l
98
$ git ls-files -- recipes-phosphor/ | grep '\.service$' | xargs grep -li mapper-wait | wc -l
32

So about a 1/3 generic services are potentially exposed.

Point 2 leads to patches like [1] where we wind up implementing a fallback to a well-known service name if we get issues with a mapper lookup. If this is a valid approach then we should just avoid looking up the service altogether; implementing this fallback approach everywhere seems tedious and error-prone, and the lookup is a waste of resources if the fallback works regardless.

By moving to well known service names we can exploit more of systemd's D-Bus integration with units of Type=dbus, and depending either on unit names aliased to D-Bus service names, or on D-Bus service activation, and receive reliable behaviour for D-Bus-based dependencies.

Point 3 is something William has complained about, and I think it's a good point - avoiding IPC where we can is a good thing no matter what we're doing.

I'm kicking this thread off because it's something that's bothered me for a while. I've complained about it to various people in private but have never taken it any further. My impression is that there's support for the idea that we move away from the mapper for service lookups (though we can't eliminate it entirely, we still need the interface reverse mapping feature), and I want to gauge how much support it has and whether there are solid counter-arguments.

Cheers,

Andrew

[1] https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-state-manager/+/20460
