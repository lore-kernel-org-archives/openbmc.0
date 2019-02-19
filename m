Return-Path: <jandraara@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::b31; helo=mail-yb1-xb31.google.com;
 envelope-from=jandraara@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="itH+gk9d"; 
 dkim-atps=neutral
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 443pbT24BGzDqGY
 for <openbmc@lists.ozlabs.org>; Wed, 20 Feb 2019 05:07:01 +1100 (AEDT)
Received: by mail-yb1-xb31.google.com with SMTP id 7so8461264ybp.13
 for <openbmc@lists.ozlabs.org>; Tue, 19 Feb 2019 10:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=jQnF5LZEVTS98WGaRi+ps+DNwGBzmPa+UNM8exoCU7k=;
 b=itH+gk9dsPxjZXBjJkW2EfGhsZmB9DccynfB2o590alTa9iMS3LqZpJBwr/dnq6uMp
 Bqq8sRmUiEX64/KU5iaQGaLkJh684VLE1wnhIJsj3WYeRETaudglnOuE/EpUz2WQ9C0e
 hKu/M7OXybyDNZ+RP0rUEUCxrJFCSdDl9A12gwZ4v4iJfWOjG6R2TAdpRZA7zEi1/6Lv
 Dxf0e5Xg+uA3HhYixtzCx75P/hjarjyJbvG+kwv+ApyOOm3Kr7/sW2aHPJojDAilYgh9
 bViQSGDgQQrMRyFK5+aMj71ODiYawZbLZwjWjPiYL8gZDyMJm5n6oaCdTwaMpyFUO63Q
 sQ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=jQnF5LZEVTS98WGaRi+ps+DNwGBzmPa+UNM8exoCU7k=;
 b=cmkbOma0gFj/oEXtB9vyrj35NC5BED0cbiAHLGrFpKN2rPFi12EsRA6kCz3nmHctlA
 R8SzamwJARrwiQq03TUfMGzKrb2VGRbmHApVRVNLecyWEsv4De+JEDILVcFaiOJKUJ8j
 Jor2tP8+Xm55yMG24D59RZCsVXeqSjQuo2M+vfhL//BdxaoDDq25kgQL9pytlgskksvs
 L7+UpMfyEC2K9C3JwG66HSJ5EDxa5omXlJIiPXWlR0k74EP8I/FUAhE9R8zjHeeYC9QY
 e8n5BVV08DsTkmxein62Z8YG8JOKay1KGf239I9zzRzkD6lNyN8vXq+8BoQhN7+rNO0b
 766A==
X-Gm-Message-State: AHQUAuawyPZDalylNyTvx1PscBCdQ5eF24h/eZuh3RKGTx/NxcqTsea3
 ZZyfYmJGEkHDKH5bjoYCq6gQfvQqnjhXMIgCEFNNLear
X-Google-Smtp-Source: AHgI3IYVWsE9nhrjkt0962b7djSmdP2DrHxCVh0JmpCYXs9wFjTuKL5aLCoQci7CyMAcNSQvfHh6TgKzMWgcFYRMmn4=
X-Received: by 2002:a25:6e8b:: with SMTP id
 j133mr24120502ybc.220.1550599618569; 
 Tue, 19 Feb 2019 10:06:58 -0800 (PST)
MIME-Version: 1.0
From: ja az <jandraara@gmail.com>
Date: Tue, 19 Feb 2019 12:06:47 -0600
Message-ID: <CAMTupoTHEEE1vWQr8BwDkEJBUj=kzCwufS8fdLKecdHs6ghyCw@mail.gmail.com>
Subject: UI Design - Sharing Updates and Requesting Feedback
To: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Tue, 19 Feb 2019 18:07:02 -0000

Hello all,

Your feedback is incredibly valuable for the UI design team to move
forward with confidence that we are designing what users want in a way
that can be built, so we're continuing to look for your feedback and
expert knowledge.

We=E2=80=99d like to share the most current designs. Please review and prov=
ide
feedback by clicking on the bottom right corner of the interface where
it says =E2=80=98# Comments=E2=80=99. You'll be able to place comments by c=
licking
where you want to add a comment. You can also tag other people with
'@' (ex. @jandraara@gmail.com). Right now, these are static images so
to navigate through the designs, use the right and left keyboard
arrows or click on any flashing blue rectangles you see.

As a reminder, we will be having a GUI review meeting tomorrow (Feb
20) at 7:30AM CT. Meeting info:
Webex call-in: +1 (669) 234-1178 | access code: 927 911 682
https://ibm.webex.com/meet/susantj

IN PROGRESS:
1. Firmware:
https://ibm.invisionapp.com/share/RQNYHJ0VBDY#/319006100_V2-1-_Firmware
- What is the user intention behind switching the primary and secondary ima=
ges?
- How do users want to engage with the secondary image?

2. LDAP:
https://ibm.invisionapp.com/share/RQNYHJ0VBDY#/318942513_LDAP_Disabled
- Working on a design that supports each server URI having it=E2=80=99s own
set of properties (passwords, LDAP type, search scope, etc)

3. User Management:
https://ibm.invisionapp.com/share/RQNYHJ0VBDY
- Are user ID=E2=80=99s needed?
- Does =E2=80=98unlocking=E2=80=99 a user require a password reset?
- Who has access to this panel?

4. Network Settings:
https://ibm.invisionapp.com/share/RQNYHJ0VBDY#/319002386_V2_Networking_Mutl=
iple_VLAN
- Is the relationship between VLAN and interfaces correct?
- Are adding a DNS server and adding an IP address separate actions
with a single intention or are they independent of each other?
- Is there a use case for combining static and dynamic IP Addresses /
DNS Servers?


COMPLETE:
1. Login
https://ibm.invisionapp.com/share/RQNYHJ0VBDY

2. IP KVM
https://ibm.invisionapp.com/share/RQNYHJ0VBDY#/318953777_IP_KVM

3. Virtual Media
https://ibm.invisionapp.com/share/RQNYHJ0VBDY#/318954652_Virtual_Media_-_1_=
Empty_State

4. SSL
https://ibm.invisionapp.com/share/RQNYHJ0VBDY

5. Date & Time
https://ibm.invisionapp.com/share/RQNYHJ0VBDY#/318994111_1-_S_Empty

6. SNMP
https://ibm.invisionapp.com/share/RQNYHJ0VBDY#/318996535_1-_SNMP_Empty



Thank you for your feedback.
UI Design Team
