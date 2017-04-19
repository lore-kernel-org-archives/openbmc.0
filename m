Return-Path: <peterh@google.com>
Received: from mail-io0-x232.google.com (mail-io0-x232.google.com
 [IPv6:2607:f8b0:4001:c06::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w7XG639s5zDq5W
 for <openbmc@lists.ozlabs.org>; Thu, 20 Apr 2017 05:32:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Beww017X"; 
 dkim-atps=neutral
Received: by mail-io0-x232.google.com with SMTP id o22so36133537iod.3
 for <openbmc@lists.ozlabs.org>; Wed, 19 Apr 2017 12:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=qJUdj1XoI2T04y8+T9+QbjTK5f1t0GylWCnlYHJOo0w=;
 b=Beww017XwPGncWr79ophrSb6k2xa/91gMrBuJx38D5+dyHryWCowjUiOtkYhP/QO1r
 os5hQ6YVuxrTegxyQOkY98VlMl079lwhysHH1HniBCX/wyfSpQ8HlDugeE6mzhbBJlhT
 9cwM19HTnkh9tpzvdz4FguqjCp7CHVTgMjSmN5fo4t7Fd49mor4REBxhzjwERNjPeJer
 kyoPiA76NAsJAxIRJTxovjx9mkLMcjW+TALhxtMRQUgTkiuCq4p34/Ana4w+g9XTm60U
 0FwAzsklopp9+5fFnOk7d6RioQmhAW2YTdCZYqKR+1Wj2DwpAGBtTJJWzekAev8BQPNY
 CEJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=qJUdj1XoI2T04y8+T9+QbjTK5f1t0GylWCnlYHJOo0w=;
 b=pVDUON8YTba+KOP/UD83jdy6zmi9ENa3+U/Cma+9N6vUdW5NeIYVD6Br9re/0nqcVe
 fxFC0xRzy+Or8nPCMe7qlJcEbtA79liA/fHL2SlQgQ8u6Js4OvU8GaY3w5AiS+7TFkVO
 nme9bs5BAAgXfPKX7erMOuJl7iXQW1n3zM/H4gS4en4RW4GbOs6BCbk4X44ad+1850C7
 /Gooeh2Fx7y9MPVc3IWPM2A/tU6SeDW+c4Q2cJQVYVdq6XocNDGWu4AmuoIIUAfZ/vlR
 6DPJbFCHUU08L8r0dc/Pvekfhlbu9RmArtMCUxPWpRijAhFBjv+7LS+bOz0n5qLRlza8
 MapA==
X-Gm-Message-State: AN3rC/7ncDHj4c22wgIG3058uz1QD/AFRH147JkClZm0EwbItxaNlm11
 VfA0VSemdQGJTqwVMy2xnSjrjIcVmhnm
X-Received: by 10.107.26.17 with SMTP id a17mr5216513ioa.72.1492630363507;
 Wed, 19 Apr 2017 12:32:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.36.84.202 with HTTP; Wed, 19 Apr 2017 12:32:42 -0700 (PDT)
In-Reply-To: <11221492599488@webcorp01f.yandex-team.ru>
References: <CAPozSNp_S_-N8YV=ruAzYVxWy4FgcJvyK27HFb0YL-mNYP22xA@mail.gmail.com>
 <58EE852E.8010005@linux.vnet.ibm.com>
 <214891492421512@webcorp03h.yandex-team.ru>
 <OF8A3EF940.D392E785-ON86258106.0069CC22-86258106.0069F96F@notes.na.collabserv.com>
 <11221492599488@webcorp01f.yandex-team.ru>
From: Peter Hanson <peterh@google.com>
Date: Wed, 19 Apr 2017 12:32:42 -0700
Message-ID: <CAPozSNp1gR1tKyz9qgX+F-wV4xftb5_WAa5tibDP8+xixf8J1w@mail.gmail.com>
Subject: Re: Plans for BMC i2c to host bridge via IPMI
To: "Anton D. Kachalov" <mouse@yandex-team.ru>
Cc: Chris Austen <austenc@us.ibm.com>, tomjose <tomjose@linux.vnet.ibm.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 19 Apr 2017 19:32:47 -0000

Anton,

Thank you for the interesting contributions. As noted earlier, the
Master send-receive message is inadequate to describe the private bus
array in a modern Bmc. And has other senseless limitations. But using
another message seems like a small difference. So I have been studying
your design for its key ideas.

I have some basic high-level questions and/or guesses.

A higher level entity sends messages to one `adapter', which then
sends them to i2c. More-or-less separately, a slave adapter receives
replies and converts them back to messages to that entity.

I now think ipmid can act as that entity. If so, it would be useful to
understand completely how that works.

I see what looks like usable slave I2C adapter code. Is it for
multimaster I2C bus? Or do infernal messaging flows also use it?

Thanks again,
 -- peterh
