Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::232; helo=mail-qt0-x232.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="RuFyJwxa"; 
 dkim-atps=neutral
Received: from mail-qt0-x232.google.com (mail-qt0-x232.google.com
 [IPv6:2607:f8b0:400d:c0d::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41BWS14h2nzF0Pd
 for <openbmc@lists.ozlabs.org>; Fri, 22 Jun 2018 05:08:00 +1000 (AEST)
Received: by mail-qt0-x232.google.com with SMTP id a18-v6so3858828qtj.4
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jun 2018 12:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:cc:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=NJDB5Z3bGW2zBiF5eUID+VMwJ8Q4Own+0OnRPihL6rs=;
 b=RuFyJwxavflWmkT/KnLtgwsWDXyAsY2J6uMZRytqYYZiRoRtJB/bbrMTX11LnJaFr2
 6O4Ovljj9L+bPYV6Z/M50I/NxIASoiNHHe8xmb/CN0lDSiUlcgCiwL+kE0r2OoYxnrW1
 LW7nBp+bjIQIzebht29vhh9eSYVNJAcFDdf2saWGfLdBQW16VB8dEL3khomDR4J01RqB
 0YAfemsGr3yAGNaJBHStB5ExSj3jib9MZhY11KxjkLa54NQtU6MXwgtSl7+SqsFPlK8x
 Dz44hypJCN6o6qM5HqSA3jjIaQo1JTjZ/lszKcAYvorvSO/YpgO2fiwkgeaUUl/z7GQ3
 THHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=NJDB5Z3bGW2zBiF5eUID+VMwJ8Q4Own+0OnRPihL6rs=;
 b=DOCvMxhKxhQ7P5UmO03el1PqsbJnUhaZT5KyGh6pFUg0xjLz1a4/NMdoSWBF3OBqfq
 JWgcBeyy/+b4f3q8fzEqkPCsdDylLX3Ufg+bivkbic6Vyv/PaNCNALBtEAhTF29F5dBJ
 ci7bmTYC66GYWOb9PTMC3WhFFXew5GSmro5NXuzhJK5neL3ju3l2eIQVt7u4TTGjdana
 Ug6nJLu+gP5lIG2oWDlLfNHCJQkBxQYT2iNpYWqyEqxy03bUrxweiVXuxj7uVEc+ujbJ
 QPoeN/RQmWfGL72orij3cCHut+wdmkeC/eFi+CIxDjqmpIJWDVmfHmTXrk3k7gVvLcwI
 QLWQ==
X-Gm-Message-State: APt69E3dexIeeUo9hc8kuVQJzrObGL9QirsG7inz9h+f6nR6fDz8zBNX
 yXz2P8h9NiRJgUCXUXivojw=
X-Google-Smtp-Source: AAOMgperuWyMOdD7bejb/JG6I0d7cpLP0/oT7eUdKeYvYPePaNG/b5SjWMbWNEfozjBB5M4xaZ0Mlg==
X-Received: by 2002:ac8:33e9:: with SMTP id
 d38-v6mr3835045qtb.184.1529608077946; 
 Thu, 21 Jun 2018 12:07:57 -0700 (PDT)
Received: from krtaylors-mbp.austin.ibm.com ([32.97.110.51])
 by smtp.gmail.com with ESMTPSA id s128-v6sm3455767qkh.2.2018.06.21.12.07.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 21 Jun 2018 12:07:57 -0700 (PDT)
From: krtaylor <kurt.r.taylor@gmail.com>
Subject: OpenBMC Release Planning Working Group
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Cc: james.mihm@intel.com, sdasari@fb.com, alirhas@microsoft.com,
 yuenn@google.com, bradleyb@fuzziesquirrel.com
Message-ID: <f86c688b-b237-bdd5-12a0-385f96902581@gmail.com>
Date: Thu, 21 Jun 2018 14:07:55 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Jun 2018 19:08:03 -0000

Hi all,

The long anticipated OpenBMC Release Planning working group is now 
forming and will have its first meeting next week. I would like to keep 
the meeting small at first so that we can move quickly, but I do need 
complete representation. Please let me know if you'd like to participate 
and what day a meeting would work best for you. Those on copy should 
plan on attending or at least make sure someone is covering for your 
organization.

Let me know if you have any questions.

Regards, Kurt Taylor (krtaylor)


Proposed times:

1) Tuesdays, 2:00pm Central US (1900 UTC)

2) Thursdays, 8:00am Central US (1300 UTC)

3) Thursdays, 3:00pm Central US (2000 UTC)


Initial Agenda:

1) Agree on the release process and set an initial release date in 
November (see email from May 21)

2) Set design and freeze milestones

3) "Must" deliver items for November release

4) How to open the design and development for a needed feature
