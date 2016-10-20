Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x242.google.com (mail-vk0-x242.google.com
 [IPv6:2607:f8b0:400c:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3szs6h0HrNzDvPY
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 12:44:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=E/Cvr1SE; 
 dkim-atps=neutral
Received: by mail-vk0-x242.google.com with SMTP id 2so2101176vkb.1
 for <openbmc@lists.ozlabs.org>; Wed, 19 Oct 2016 18:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:from:date:message-id:subject:to;
 bh=nmFLaNU19vsPa8eq3B+8hj4NK2afqssuQdeFXgh/Sz0=;
 b=E/Cvr1SExpyhJfkPdS6lTKonX0g8L4mSoKAV4UdY9Dz4xG/wgWNmtF0sckBz/tMdOJ
 UcXGoleEAZVO1rEhUq9sH+UyO5e2Jm3heqN1GOTrzBIDUHxjgWCcLfnVYq5MfmsFUi05
 M+pCUYiybObJDM6R63LtudydXfSJ0kzAheiyc4djMjNgStUdBliXM4quz4XAsBcN1Vfp
 E1c8CQEuY2i5PSDJegBoZmm6S+Ku/6AwG1pAwwISMbMVQ3h2fyojSpJcE4irEghkWcYp
 gJHtuNhZH4jwBGnSvuRHF6QvF7wGF+ibVRIsS5bOi2l+BGwosW54ChpXCOOj+LAPY8+Z
 ZHJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
 :to; bh=nmFLaNU19vsPa8eq3B+8hj4NK2afqssuQdeFXgh/Sz0=;
 b=YAQj/wDxG2vLulsuvvH8+KxrpMIvBkX4++OCyV6/L5DGwq/r87pEUvyLY0icxapCl3
 s5m5ux+a9LlO6U10GrvfK4c78x8MdSAch4fUJW6eQdf3yGPLOiHDNTeYDm4s8CUa9Jlt
 /HNlfFKsodmYfyUn0vU2bCxsC2hPltWPFf5rY8eFHYYt5meB+pj0gupa32B1TAYUhavQ
 h7T0qVABSl3bE8jtRyLIhERE4HzCTUxX04ufIqbrlE49wHy/i+VgJPKcgDH7vBzEDIr9
 bM5bfI1juA/v0qqfxm2QI4lhjisy5lTev/W3u5pzKsxeTLHsNApZdry1HH18UMKEU9Y2
 fiyw==
X-Gm-Message-State: AA6/9RkPB46V50rjhJnX9EcnlBWUSKPpjQE4R4ZZ4t+IzAMIo3kWHE9wyn6v/e0zEiaeoNvET7PRTHpqi2Tycg==
X-Received: by 10.31.166.208 with SMTP id p199mr7444279vke.145.1476927849704; 
 Wed, 19 Oct 2016 18:44:09 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Wed, 19 Oct 2016 18:43:49 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 20 Oct 2016 12:13:49 +1030
X-Google-Sender-Auth: 4YwB726nc5gwViy_UvaXD7yz3EE
Message-ID: <CACPK8Xe12uXO+YfxS_fvwd=4RqBsS_M1ahj9KD=sv9ERMgVOrA@mail.gmail.com>
Subject: Merging rights
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Patrick Williams <patrick@stwcx.xyz>
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
X-List-Received-Date: Thu, 20 Oct 2016 01:44:12 -0000

Hello Patrick,

I've had this patch under review for a few days. It's been sitting at
+3 for about 5 days now, but I can't commit it as I don't have
permission.

 https://gerrit.openbmc-project.xyz/#/c/762/

In light of this I think we need more users with permission to commit
when code review has been completed.

Can I please be added to that list?

Cheers,

Joel
