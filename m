Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::330; helo=mail-ot1-x330.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="O2l5wkpL"; 
 dkim-atps=neutral
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42DVvL1vPJzF2ZL
 for <openbmc@lists.ozlabs.org>; Tue, 18 Sep 2018 01:50:21 +1000 (AEST)
Received: by mail-ot1-x330.google.com with SMTP id 36-v6so11787089oth.11
 for <openbmc@lists.ozlabs.org>; Mon, 17 Sep 2018 08:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=N2ICURU6pTUS7HBhkR+hMBoluPJ/JM2ppkCFW1Tl4E0=;
 b=O2l5wkpLBpXTvYOzFw8jLftpfszYUNhHLldb16dn6AZn4XjNSfiXqvC3rDYMRWmMGN
 qqovcnjuP45f+JOIbXrQWIkudrt2Ta0Rmix6K8tWOVbIQRPh2u9oWOnR/EuBFeEC5143
 Gk38d/OAjfnRDHcqZ9SyoPfjW3fcPdtlikTtXGKIg5Ir8wZ33oTrDqJqVJeDNYcD4eVL
 rhSRUZnoYFW0BaCVYynahhwcHlSmqReJlpDYbqV/OfbIQ4caVLV8kwCWzwFjrTZlU9Su
 g1r/dtejr6DLbp2lLban8jLtvhlhaZvt0PVJiNygrGNuiB7NjVaKagp3Siq7NxRGZU1j
 IjFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=N2ICURU6pTUS7HBhkR+hMBoluPJ/JM2ppkCFW1Tl4E0=;
 b=QuNV6EXiHtozWJmK36AXfpcrW7FBidIRe3hMf/b2JLVIz93qVC3wnDK3oOiqPu9yTL
 VIV56r+cYU+QkujmCRvpI+RQ5d+vnuv4LI5z0M855QvRyhDnX9kiSlF+AlE8IvZpvEtw
 990NE5bypc1GEYEjEm71q6WCNZyVIC1leabWYdEk/s1TkzBzfnegtrmGW7K+b/k9FjVf
 Tfe369tRbOeRHSeuDziJq1XOuk3rPIFkMH83z66+/I4Hoj0vuxyKx7rkdi7hgasGcTpA
 nPAuAhVRMP0GQ1k7u4nnWt9qo2x4vvCcDgXbrl2QGlpAeApi+hZBdNt7I7WOK4Y343Hq
 pViw==
X-Gm-Message-State: APzg51ALI7gvkAP5LD0v+vbw+J9f9NMWjHB4qVcn0YaXCyoXMdLiwv86
 rJlHLFc9YI0guF8TFy+5T1XBEar8
X-Google-Smtp-Source: ANB0VdYjzMUuJj4Z1GAZn/qi1SAVfpZyiPczrYzrAdagjevk4dGdsQ9HfuK1SMuyEUQmcGMpwmQBfg==
X-Received: by 2002:a9d:4905:: with SMTP id
 e5-v6mr13487864otf.368.1537199419737; 
 Mon, 17 Sep 2018 08:50:19 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id h34-v6sm4648310otb.71.2018.09.17.08.50.18
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Sep 2018 08:50:19 -0700 (PDT)
From: krtaylor <kurt.r.taylor@gmail.com>
Subject: Release planning WG - Meeting changes
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Message-ID: <c069a114-ac4c-f13b-b58f-3e1dbff2b857@gmail.com>
Date: Mon, 17 Sep 2018 10:50:18 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Mon, 17 Sep 2018 15:50:23 -0000

Hi everyone,

The Release Planning WG is going to start meeting biweekly starting next 
Monday at the normal time. No meeting today.

It will be an open meeting going forward, refer to the wiki page for the 
latest contact info and times.

https://github.com/openbmc/openbmc/wiki/Release-Planning

Thanks!
Kurt Taylor (krtaylor)
