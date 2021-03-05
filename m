Return-Path: <SRS0=sdHm=ID=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BBE7C433DB
	for <openbmc@archiver.kernel.org>; Fri,  5 Mar 2021 08:26:51 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D43A465014
	for <openbmc@archiver.kernel.org>; Fri,  5 Mar 2021 08:26:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D43A465014
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsLS92grnz3cJM
	for <openbmc@archiver.kernel.org>; Fri,  5 Mar 2021 19:26:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=fOj2rM9J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::929;
 helo=mail-ua1-x929.google.com; envelope-from=deepak.kodihalli.83@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fOj2rM9J; dkim-atps=neutral
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com
 [IPv6:2607:f8b0:4864:20::929])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsLRn2Fwdz30JT
 for <openbmc@lists.ozlabs.org>; Fri,  5 Mar 2021 19:26:28 +1100 (AEDT)
Received: by mail-ua1-x929.google.com with SMTP id o20so508171uaj.9
 for <openbmc@lists.ozlabs.org>; Fri, 05 Mar 2021 00:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=qEu+FccS2Ntkns8MZlIKjVmKhk/T/yxzV4X9VcFjSFY=;
 b=fOj2rM9J/InNiElC/G45lRe1iLaE3TDct4Wcb4a4Gv3FpV3btfrtKuCOpJ3pnQJd1X
 v/G7HW7pjlL/MlMdeKSTcG/1jq2ny5IRrNL3v+Fqde6m/BA8d+fYGBMfzO0A//X0ohvf
 hC5D76zCla3r40Ut1o+sbLcTe2IAyVfUZ1W+IMqHaMgK72BVBJbYBuYVDAvOLBq0Sdst
 M7u+hSmsG8mV4iFW303X72XUpovdENK3iLAvl1gpyM22V7goqheH/fQ6uJp9TvyfxooQ
 b0N3P/BpXUU5S0sowd1TIxK7WfVHZ2XntZXU9cqdHmqsXq0DIVUNTkW8n4rxFdbPJx1S
 HGSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=qEu+FccS2Ntkns8MZlIKjVmKhk/T/yxzV4X9VcFjSFY=;
 b=RHBHe4AHA8RlGtatUJqfH98fTgQfPrJ1CV9Y1Pwb33oc4aAXdJxblsrM++TMwidb9c
 QSTJvb6iAbpyDuqFQaLc/D2vPbLrK2gfhrii7wtRxN0J/rThJXZE5PId3BIJC71BxV5+
 NUflgJJBGLay0rKBZ9EUuAi16v3wEDgM5sDIHQaUAZCCkOqw4D3pBFOmQ/EiB1mXEv9C
 10BeO7TzCnxPAU27GxlGwWCeE2shfcR/TN0ar/KGKsJLHijCZazBJX1dzExwQBOOddhJ
 5cxFTvEDuISNtxxv6pHjPQ8XsaziwlKWstM+SDH+fCMTnP9s1W9nCoqXEAjgM9+j720c
 2ezQ==
X-Gm-Message-State: AOAM533WynFSTlXyRTuVwcRLD50WYJmhTBmKRGG53ek7Yg1NWTb1ZtU7
 IkoufQsZdK2WpAnSG7sjEfSYFR6bnJmrZGnfEgpz+y+9
X-Google-Smtp-Source: ABdhPJwSzEjFCFGiXSicvcts3ySknsuBfsv5NYGZwkuMUbd4+IKkiwUc860rfdUTBPaz5O4RCsKUuy8Jtl/djHiysaI=
X-Received: by 2002:ab0:4e1c:: with SMTP id g28mr1146589uah.48.1614932784186; 
 Fri, 05 Mar 2021 00:26:24 -0800 (PST)
MIME-Version: 1.0
From: Deepak Kodihalli <deepak.kodihalli.83@gmail.com>
Date: Fri, 5 Mar 2021 13:56:13 +0530
Message-ID: <CAM=TmwUdmv-sBwCtqp=j05pqsSuM-8QZ1p2+=9h+jMLf8VSQHg@mail.gmail.com>
Subject: Redfish Aggregation between BMCs
To: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Hi All,

I've seen several email threads (apologize for yet another) regarding
the multi-BMC/Redfish aggregation problem. The specific problem I'm
interested in solving is BMC A wanting to aggregate BMC B's Redfish
resources into its own Redfish model. BMC A and BMC B manage separate
parts of the system and BMC A is the point of contact for external
management clients. Seems like there are multiple options that have
been discussed:
- BMC A talks Redfish (as a Redfish client) to BMC B over a network
and then aggregates responses into its own Redfish model
- BMC A and BMC B rely on some in-band protocol (RDE/PLDM over MCTP,
IPMI, something else)
- Use the Redfish AggregationService schema (this sort of moves
aggregation responsibilities to the Redfish client of BMC A)?
- Others?

Is there a preferred approach, or is it determined based on how the
BMCs are connected?

Thanks,
Deepak
