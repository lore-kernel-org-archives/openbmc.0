Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40BsC34XchzDqwb
 for <openbmc@lists.ozlabs.org>; Fri, 30 Mar 2018 04:27:42 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id F315FE55B4;
 Thu, 29 Mar 2018 13:27:38 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: Attention users of network IPMI
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAJoAoZ=KHfsjEmzYVMB=U8Pe+ioj6L6BPqxXwNvdHTY5LUZVmQ@mail.gmail.com>
Date: Thu, 29 Mar 2018 13:27:38 -0400
Cc: Alexander Amelkin <a.amelkin@yadro.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <D0A98E6B-DB14-4055-B5D1-586EE7191A23@fuzziesquirrel.com>
References: <d58f47d2-310c-f6cb-1ef0-6f7cae9bf7c0@linux.vnet.ibm.com>
 <4333c25f-d5bb-e4b8-f6c4-62deb53362a1@linux.vnet.ibm.com>
 <20180329161612.GA1946@cinnamon>
 <CAJoAoZ=KHfsjEmzYVMB=U8Pe+ioj6L6BPqxXwNvdHTY5LUZVmQ@mail.gmail.com>
To: Emily Shaffer <emilyshaffer@google.com>
X-Mailer: Apple Mail (2.3273)
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
X-List-Received-Date: Thu, 29 Mar 2018 17:27:44 -0000


> On Mar 29, 2018, at 12:37 PM, Emily Shaffer <emilyshaffer@google.com> =
wrote:
> On Thu, Mar 29, 2018 at 9:19 AM Alexander Amelkin =
<a.amelkin@yadro.com> wrote:
> IPMI defines user privileges (user, operator, administrator, oem
> prooprietary privileges), and I think we need to support them. I'd do =
that via
> standard user groups.  The root username may still be available with
> 'administrator' privilege level (user 'root' included into 'admin' =
group).
> That way we can rely on standard means for authentication and =
filesystem
> permissions, and maybe have some pam plugin for interaction with =
phosphor
> (e.g. to check whether a user is disabled).
>=20
> I thought Intel (Ed?) was working on something related to this.  Could =
someone comment?

There is this:

https://gerrit.openbmc-project.xyz/#/c/8440/

and these:
https://lists.ozlabs.org/pipermail/openbmc/2018-February/010742.html
=
https://lists.ozlabs.org/pipermail/openbmc/2018-January/thread.html#10344
=
https://lists.ozlabs.org/pipermail/openbmc/2017-December/thread.html#10054=


None of this has seen much activity lately.  I=E2=80=99d encourage =
everyone to
leave feedback in the proposal made by Richard and/or to carry that
proposal forward.=
