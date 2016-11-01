Return-Path: <brendanhiggins@google.com>
Received: from mail-vk0-x233.google.com (mail-vk0-x233.google.com
 [IPv6:2607:f8b0:400c:c05::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t7NzV0tQfzDvNV
 for <openbmc@lists.ozlabs.org>; Tue,  1 Nov 2016 19:04:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=ntOXAYgX; 
 dkim-atps=neutral
Received: by mail-vk0-x233.google.com with SMTP id d65so96187971vkg.0
 for <openbmc@lists.ozlabs.org>; Tue, 01 Nov 2016 01:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=uqQKz4Lo8q9PQGm0ZN40a5okwLkFpGNryCkwX9YHJH8=;
 b=ntOXAYgXFWJqvJuRFlATocOT5iAfiNVX/gcgHk7bJAXLRMPkKM0KVbsZABdjl58Ba7
 fZyYu6QhRzEUZnimuff8Bx9Fo0JnXqzCi+f+8EAKY8DthssSXVeeKDocjY4IKJ7zD0MY
 HEfJauCetr270casTA1W/VTMNqJNkYnUgvfD1SSKHayh2PpAEZtuSKK+sZ74edc18/XX
 F8H71R1pWVo4UwpjLYh8/wGkXYGqQZpEgAAVpSaKsI5Gjat4Lp5QRGj/ZePgw85b+SBn
 X34jolr/7BktduWU8ELV77OvsFy1ktH7uCnHQdkWry+uQjU65Xsf5OxuP94Dpfs+FL17
 l4wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=uqQKz4Lo8q9PQGm0ZN40a5okwLkFpGNryCkwX9YHJH8=;
 b=kqcH9+rZAF8PZfSviuZhiIzRTh7YRb9t66E4+G4zp4w3U/krF9RFK4XmhFnMc+aIZW
 rUxrQTUWozcQCEHIK25VYza5+0mxHY2YNAmgErcqtNrGpuY5EZjFxc01fU/kjiJJ2qTJ
 Rv5eWJ8w1SldJ7O7PGLuYgQWA2IwsJr9J9wc8zVGVEW53T0r7IX5C9e6TwmT7sJh4Qo9
 54wYNd4ToL/4YvoQOV/jx4AZFBQ9rbjqB/c96SSipOk0f+O6WCam4wN0mU5Z6VUsX72z
 yEB9BFRNuKiPDdKNQHtASgN35+PIss9liSRS/f3rje3zmrMYXREgpxWs62MLlBPB0V7r
 vTGg==
X-Gm-Message-State: ABUngvcEf1GsE6i8pF7lNwobVY/tGHHVHy4XC5XNvfWEj//3Nb1SK0WPYzCBPL2ppFDgQHlXdhnHm53oKAKnqqS8
X-Received: by 10.31.156.205 with SMTP id f196mr23261737vke.45.1477987442190; 
 Tue, 01 Nov 2016 01:04:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.5.102 with HTTP; Tue, 1 Nov 2016 01:04:01 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 1 Nov 2016 01:04:01 -0700
Message-ID: <CAFd5g47EH6Q=CAbs7BTBC7JBg_Gv_otK78p3hP431qBAKq=fuA@mail.gmail.com>
Subject: Adding a MAINTAINERS file
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Tue, 01 Nov 2016 08:04:06 -0000

For those who were not present, there was an OpenBMC meetup of sorts
last week. One issue that Nancy Yuen, Abhishek Pandit, and myself
brought up for non-IBM contributors was ownership and organization of
projects; this went in a couple directions, but at some point somebody
proposed a Linux kernel style MAINTAINERS list as a way to find people
relevant for discussions in the various sub-parts of the project.

I made an initial implementation: https://gerrit.openbmc-project.xyz/#/c/94=
4/

Most of it should be pretty self-explanatory (if not please join in
the discussion). Nevertheless, I distinguished between reviewers and
maintainers; whereas a reviewer is someone who is familiar enough with
a given part of a project that she is a good person to address
questions to concerning that component and should be included on code
reviews; a maintainer is someone who's approval is required to check a
patch set into a repository.

I chose reviewers based on the amount of commits contributed to a
given repository; I know this is not the best way to decide whether
someone should be considered an expert on a particular part of the
code base, but I thought it was a reasonable place to start.
Additionally, breaking things up only at the repo level is probably
also not the most useful as people may become experts within a
particular part of a given repository, but again I think this is a
reasonable starting place and I added semantics for breaking it down
further.

For maintainers, I chose two people for each repository; the first is
the person who already has the authoritative access I described above;
the second was chosen to be a major contributor. For Linux, u-boot,
ipmi-tool, and qemu that is some combination of Joel, C=C3=A9dric, and
Jeremy. For everything else, all of the userland stuff and yocto, that
is Patrick and Brad. I recall discussing adding Brad as a maintainer
for the userland stuff in the meeting, but I figure it is something we
should also discuss on the email list for everyone's benefit. We had
not discussed adding a second maintainer for anything else, but I
figure it is probably best practice to have more than once person who
can submit code in all cases.

I fully expect that the MAINTAINERS file I uploaded will require a
good deal of discussion before it is ready to submit, but I figured it
would be easiest to start with something to talk over.

Cheers
