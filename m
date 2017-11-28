Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::234; helo=mail-lf0-x234.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="kFeZ7WuP"; 
 dkim-atps=neutral
Received: from mail-lf0-x234.google.com (mail-lf0-x234.google.com
 [IPv6:2a00:1450:4010:c07::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ym7Dx1TGmzDrPk
 for <openbmc@lists.ozlabs.org>; Tue, 28 Nov 2017 13:40:16 +1100 (AEDT)
Received: by mail-lf0-x234.google.com with SMTP id x76so30560446lfb.6
 for <openbmc@lists.ozlabs.org>; Mon, 27 Nov 2017 18:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=g8qnxjg4SMceafaEJmWyBKAD4MJD7zPTDbX/HHvWlwo=;
 b=kFeZ7WuPDBWC48XvbbWl54wLm4cHh43He2x9k59JjnRR09ZVtv7kx5JZU8qI5frAW1
 Vthdr/rzx1eUoaZs+j9s+hx3QzEZ1m3mr7KPO17SMuAJYauGNynw6Pgma4fDgdPu/XdH
 qBFVXHEpsAkBTfksiaoLbk6/ddDwtEWj7HuV+UTdzUEFYt6t9DTRXzUNnmD0pyN/jjJB
 HsnaJJw35dPClfg92p6EZgmmESg7cO6lknn2NUGSsoJPhexQEZ83bVKGHPFiEyBOvPpc
 uDmUgma7BrUOKhxyM4NrqFSQP2Vu/34FpFyU2jcRXzq7pecH9Pm2ISE8L40SaN5yc3+q
 01YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=g8qnxjg4SMceafaEJmWyBKAD4MJD7zPTDbX/HHvWlwo=;
 b=i4x8R/Zja5ihFnexIMgdt0hEk8BbM4Ys6LEUm8EwBtpSBUXd2kz2PwAH+PErlNvXa9
 YW+AXc7kHrLA3nG2wKyLryYIp5kRCthWZZcWYsqTHts65ovMmgRcRi535c8Q0U3PUY3m
 PSptEZ9BCbdPULmtcb9ipqofOQC8VVKb8aPqHNlJHRTE+eQHkDErqNb6N8gYeAkyX1v5
 Qmtm2B4blUxiCD4gf3PpvV8kgYYolkYk5u/kgvAVNuv/nsya1Nj7bV6AoqWZ3WI6mEyX
 xRji3IOLN5EicLnMLWs77/MMVbHmqI8FZ380c/Op29DD2/IlrNa5JEWlYYM21ufHkZ8J
 P7dQ==
X-Gm-Message-State: AJaThX7ugmN09sAmaJ0z8fP69+89AI1Q3KxqzVPccwTd9Y3rkjhu0rGl
 UMB5+QNMXtGlfofSF0C9fC0IdgxzOG/RdK437ig=
X-Google-Smtp-Source: AGs4zMYd0P00cQCzMzRMLCYLvxVcb1QX2R8cOXFnStsYVLcNiMlM1TbPdTNNOdEVygjfHQfd9qQ/lRPNhEGyTIWjhPA=
X-Received: by 10.25.198.147 with SMTP id w141mr12183174lff.84.1511836811226; 
 Mon, 27 Nov 2017 18:40:11 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.155.83 with HTTP; Mon, 27 Nov 2017 18:39:50 -0800 (PST)
In-Reply-To: <CAO=notyW=x_9j45SDd-75WULwXQdTHhUx65R7YUUSgaBp2+qgQ@mail.gmail.com>
References: <CAO=notyW=x_9j45SDd-75WULwXQdTHhUx65R7YUUSgaBp2+qgQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 28 Nov 2017 13:09:50 +1030
X-Google-Sender-Auth: dpZxFvOujCEJnd_TkKdK3DwlLb4
Message-ID: <CACPK8Xcv8F4WHs8bynxDSLK6pg4hYTm2w-044RmJ6dOEcYevJA@mail.gmail.com>
Subject: Re: Linux 4-10 v 4.13 patching
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Tue, 28 Nov 2017 02:40:18 -0000

On Tue, Nov 28, 2017 at 1:52 AM, Patrick Venture <venture@google.com> wrote:
> I'm sorry as I probably missed the email, should I send patches
> against linux 4.10 or 4.13 or both?

Good question. If you want something to boot this week, send them to both.

If you're just wanting to get them in the tree, then just send them to 4.13.

I am working on 4.13 but it's not ready to go yet.

Cheers,

Joel
