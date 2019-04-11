Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::843; helo=mail-qt1-x843.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="USPzgypt"; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44g0nS67r7zDqSY
 for <openbmc@lists.ozlabs.org>; Thu, 11 Apr 2019 22:33:48 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id s15so6825761qtn.3
 for <openbmc@lists.ozlabs.org>; Thu, 11 Apr 2019 05:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8n5J3n6/GiElmI6DG9UOmB8mw8JiBCrjfpez8xRj6yU=;
 b=USPzgyptRzZaj/qUluPTfNV8O/knCd4Svzl9tRLp9W8sSf8UlxEpra7EWqGnXI8L/v
 4XeCisYoPv3i1ToWiuhze+mGXmAhUdoawstMPVtcJjL3XK3sgkuGNhA5xvod0TRI110o
 CqFgN2Qe0lIdVZVS2rDGpgXJ2wZU06K0DJHSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8n5J3n6/GiElmI6DG9UOmB8mw8JiBCrjfpez8xRj6yU=;
 b=NaqhcVGDXxWpJ/rG/uN3qjWWemF0alPjvkwP8XQjecwms2t4V6abiNYdMttbBJoUrP
 DrsDXvwaE4ovW7MD1FQC1Wt1c2Pg0HAQ+mYQ1rQVY2Sd5mdLofaDIas679kiwEjaSo6B
 ZWcKPLb1JMpIFw1Yax4m/xp4C8Hw85NvK+DnqEnboQpZKfmnJzvou2jfT+AywU0spYdL
 KtJ8b+DAKEFoWNj9KnB3pKjE63BBzRlXll1cKL6P71K+KqYMXFAt9cwQZsjiqMe5gEK3
 EQ9q1dOVs92JUsTZFxtFhbAwbPkKevgj+t5urtP9SmsXfz6kw2PImMeYOnYvI0WXIJFa
 R4FQ==
X-Gm-Message-State: APjAAAUzZPnled39/DN+sRlszOzG8Z1h/0fZbjlamjb+RAJmnxZumnh5
 BVSWyUMz666WBd/Dl+ZpLdXNQu8+gKbxe2+3jQo=
X-Google-Smtp-Source: APXvYqxtWF47kv3O2lEG8pT4MOoApEGjm3n1fGhyo7dLmK82WkT01GIji+/o//KBwS/l58TWN4OoQGqtG2nbYSZt/h4=
X-Received: by 2002:ac8:2c72:: with SMTP id e47mr41130710qta.189.1554986023036; 
 Thu, 11 Apr 2019 05:33:43 -0700 (PDT)
MIME-Version: 1.0
References: <1531812378-14316-1-git-send-email-ryanchen.aspeed@gmail.com>
 <ef432789-cbfe-9adf-2562-296abc261582@yadro.com>
 <00a601d4c5bf$c01a9520$404fbf60$@aspeedtech.com>
 <a534e022-46c2-646c-9ea6-a1a2fd6ea7dd@yadro.com>
 <480daa1f8e784aad881ecb0daad62272@TWMBX02.aspeed.com>
 <d21990db-e81a-030c-1cee-4f29ce29c76b@yadro.com>
In-Reply-To: <d21990db-e81a-030c-1cee-4f29ce29c76b@yadro.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 11 Apr 2019 22:03:30 +0930
Message-ID: <CACPK8XfNyXsS3tyS8jsh60n_fiv=gtqcmZ7c5VzDJqOHCESLDg@mail.gmail.com>
Subject: Re: [PATCHv2 linux dev-4.17 0/7] mmc/host: Add Aspeed SDIO driver
To: Alexander Amelkin <a.amelkin@yadro.com>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 11 Apr 2019 12:33:49 -0000

On Fri, 22 Mar 2019 at 23:00, Alexander Amelkin <a.amelkin@yadro.com> wrote:
> After fixing a typo in your patch (ASPEED_CLK_GATE_SDCLKLK instead of ASPEED_CLK_GATE_SDCLK) and building the driver,
> we've found a minor hardware issue in our design that prevented the driver from working with our board.
> We've fixed it and it works for us now. Anyway, it would be great to see the driver upstreamed.

We can apply it to the openbmc tree if that would help. I can't seem
to find Ryan's v2.

Alexander, if you want to post the version that you tested to the
openbmc list I can apply that.

Cheers,

Joel
