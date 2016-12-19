Return-Path: <geissonator@gmail.com>
Received: from mail-it0-x22d.google.com (mail-it0-x22d.google.com
 [IPv6:2607:f8b0:4001:c0b::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tjB3R4y08zDyS5
 for <openbmc@lists.ozlabs.org>; Tue, 20 Dec 2016 06:35:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ACSjyDe0"; 
 dkim-atps=neutral
Received: by mail-it0-x22d.google.com with SMTP id x2so2945278itf.1
 for <openbmc@lists.ozlabs.org>; Mon, 19 Dec 2016 11:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=6EZ5y1t7ezASBgN+gzHrudW98XNZEYPjvyXOZIHTab0=;
 b=ACSjyDe0Ve2wF1/+wSjtc1YTbN15EGdLNyPpl3FzhLKvXP6z3WVIfmeEpb6nb3y3GQ
 KiX+wDNWgIYfDYEBvz3IAEeS5heJiHcr4iqKBASPVFmrARWTb2oLhYjCBWj7qw1tyPJY
 J+Su1VXCZnJ7kMV9CbNtvJ0YvZvluJBktRrtv4TFGA+ZWG0gy8uG0y+nOoR0RZIida+r
 dsMyVC2hTYXKRErVZnSeTtQbfgzOUQNKjGGcJajimOmWZjBpevjWyRgh+aY1NhPoiHD2
 CGqQlUPVd4hDJ/K/k2jK+lRneZSLyWZ82EikGQS9Q/+5u+vSoC43lg4/inYI7xusWN0Q
 yvzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=6EZ5y1t7ezASBgN+gzHrudW98XNZEYPjvyXOZIHTab0=;
 b=cxJf1QXoWvjl3DFPvsOSnyEHnyjOy4YTYJHRMHkLTBaWm4iZ0DQpuHm2bUJhY0l3V8
 wFP/hv0lsBjdoM7xp76dfp598aq7P7IxpnwjynNeFpZy3amaxdfyIrWHj+l5sxb22HHL
 5gCxkWdm5aIThRglhCPRWRyZdNm3tgeXdRlEAKqmSCkBE80nU+joMC5HXB3Pjnd0OlIn
 EpGEPWSBc0zbIbvp7V7WTDcxcssfVw40uWOCimaB9w8bLT8ZyxCDDSdMuNnouERP93/p
 Vgstxlr4NmzTgzSI6q202eVfAk7bcf4NAE9nh5AnunzbfQjBBZYbSUsw3L6e6Xo8ajRG
 hhTA==
X-Gm-Message-State: AKaTC011t13DW1SIcFxen+EZLZnrQ26ScBQLPaigfZLDc0Q0VrwM3NdZFjYicN/egJiBPHZ7EMeeaCP1/Z0CiQ==
X-Received: by 10.36.50.214 with SMTP id j205mr18368415ita.33.1482176145502;
 Mon, 19 Dec 2016 11:35:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.36.79 with HTTP; Mon, 19 Dec 2016 11:35:45 -0800 (PST)
From: Andrew Geissler <geissonator@gmail.com>
Date: Mon, 19 Dec 2016 13:35:45 -0600
Message-ID: <CALLMt=rbUsLWmo2knZoNq6SYQF=OGW19MEu0NbxcFd_8DJ0bqQ@mail.gmail.com>
Subject: Disabling Hardware Continuous Integration Testing
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
X-List-Received-Date: Mon, 19 Dec 2016 19:35:48 -0000

We've gotten as much pipe cleaning as we're going to get with the HW
CI.  We're going to disable it until we get
https://github.com/openbmc/openbmc/issues/862 fixed (or worked
around).  It's causing too many false failures in our automation runs.

Andrew
