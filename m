Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::32e; helo=mail-ot1-x32e.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Cu4Sj5Dt"; 
 dkim-atps=neutral
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43WRQD69vfzDqLr
 for <openbmc@lists.ozlabs.org>; Sat,  5 Jan 2019 01:05:40 +1100 (AEDT)
Received: by mail-ot1-x32e.google.com with SMTP id 32so32127611ota.12
 for <openbmc@lists.ozlabs.org>; Fri, 04 Jan 2019 06:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=dDX20e3LUwn95eG0SVUHEyYB8L7Jy5QzJQmmLovLwbQ=;
 b=Cu4Sj5Dtb2ACUn3RGZlGlTuP3BzkRJrnMnN2kM6ak48dzhwUWZyIuu2mEf7/26HEV0
 7NWQ8Ews1zAlyNqnpNctnyfAplgK1GtPd018h4Mmco4i3mngDtT7dh+afKe5zD5maXe0
 inGJanrsHBIlkR2pDMGE5sBS54qHcVFtOsisv5+44a3sxPtW7SJhDiZsvCQoeuo+jpex
 cQshNxAJfD55oGYPbuNM4KODEBfdPjNCt3/BOhCPk81uFYdNOjkPnIdBrqeGPv7RAkWD
 5nPBcPltv/IuzmMjfCijDO9FyDcg+idh4UlXY72k/AXnYBCUEyATT/jl5JdNYY/xRxh9
 V/iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=dDX20e3LUwn95eG0SVUHEyYB8L7Jy5QzJQmmLovLwbQ=;
 b=ZImkTH88gU+Z+0PGZiFSUB4nBLDga1pUvGXDI2b/9sQ+WbjYzd1isDn22ZPHmIBPDR
 +GElBWi+kePisAXCUop8/vnzHY5TIbKD+DAAxrAv/+XU7NE1585OgQY7JzatvQNjHECl
 Nad2Y+NsTdM69C+xc/IGAnGBDH674jbZZQpPCoVCjJWVLWszk6FU+kuI5ReRHLQ/ossm
 wl0hO++GMXvVhr/uVFT5NMniC8JcUQlycr87NVpyHlT5BxBT46TOsMt9oJ7aceAMtN9a
 3wKi2F9f/5Qpwg68pDoT0P/wFVMBmGI8PBCbrez6XQXjfizRPoasdTb1l0WBgJLiHhVX
 Aq5w==
X-Gm-Message-State: AJcUukc2mspa6hFi1eTJARVvbNzhrrezU0Fw0tDNWu5OWNFOD//MdBxR
 fqP/Y8b3BGSPhyQLCrqYfVbN9qI4Lq9kgLx308hfeQ==
X-Google-Smtp-Source: ALg8bN6nzUIM0vpLZfucCp8jz8m6ufsM0OEuhX6Hgcxqkqufw4OvIGH0xrmHJVJ7cW8+vFt7uOaHKfHhAEmivyiAJ3k=
X-Received: by 2002:a9d:ecd:: with SMTP id 71mr35908719otj.155.1546610737772; 
 Fri, 04 Jan 2019 06:05:37 -0800 (PST)
MIME-Version: 1.0
From: Andrew Geissler <geissonator@gmail.com>
Date: Fri, 4 Jan 2019 08:05:21 -0600
Message-ID: <CALLMt=pQG2x7RQUM2c=TfQzH5aLPNykCKBOzLLEnApMPs3Z=dA@mail.gmail.com>
Subject: Gerrit server outage this Sunday (1/6)
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 04 Jan 2019 14:05:41 -0000

The server running gerrit is on Ubuntu 14. I'd like to get it up to
Ubuntu 18 before we all kick back into gear for the new year. Should
be offline for a bout ~2 hours Sunday afternoon.

I don't plan on updating gerrit, just the server it's running on.

Andrew
