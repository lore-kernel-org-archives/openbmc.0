Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E3C641A0018
 for <openbmc@lists.ozlabs.org>; Fri, 12 Feb 2016 09:19:19 +1100 (AEDT)
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Thu, 11 Feb 2016 15:19:17 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 11 Feb 2016 15:19:15 -0700
X-IBM-Helo: d03dlp01.boulder.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id 8D8711FF0021
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 15:07:24 -0700 (MST)
Received: from d01av05.pok.ibm.com (d01av05.pok.ibm.com [9.56.224.195])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u1BMJEFQ32571576
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 22:19:14 GMT
Received: from d01av05.pok.ibm.com (localhost [127.0.0.1])
 by d01av05.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u1BMFtj7025224
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 17:15:55 -0500
Received: from birb.localdomain ([9.83.0.6])
 by d01av05.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with SMTP id
 u1BMFhAq024777; Thu, 11 Feb 2016 17:15:53 -0500
Received: by birb.localdomain (Postfix, from userid 1000)
 id C2AC72286E20; Fri, 12 Feb 2016 09:18:58 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-networkd] Validating user & group names prior to
 system call and wait() on proc spawned with pexpect.
In-Reply-To: <1455224447-11108-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1455224447-11108-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1455224447-11108-2-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Fri, 12 Feb 2016 09:18:58 +1100
Message-ID: <87egcioppp.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16021122-0009-0000-0000-0000124BA99C
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Feb 2016 22:19:20 -0000

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:
> From: Hariharasubramanian R <hramasub@in.ibm.com>
>
> ---
>  userman.py | 106 ++++++++++++++++++++++++++++++++++++++++++++-----------------
>  1 file changed, 76 insertions(+), 30 deletions(-)
>
> diff --git a/userman.py b/userman.py
> index 6109582..033d3d1 100755
> --- a/userman.py
> +++ b/userman.py
> @@ -25,7 +25,8 @@ OBJ_NAME_USER = '/org/openbmc/UserManager/User'
>      Object Path > /org/openbmc/UserManager/Groups
>          Interface:Method > org.openbmc.Enrol.GroupAddSys string:"groupname"
>          Interface:Method > org.openbmc.Enrol.GroupAddUsr string:"groupname"
> -        Interface:Method > org.openbmc.Enrol.GroupList
> +        Interface:Method > org.openbmc.Enrol.GroupListUsr
> +        Interface:Method > org.openbmc.Enrol.GroupListSys
>      Object Path > /org/openbmc/UserManager/Group
>          Interface:Method > org.openbmc.Enrol.GroupDel string:"groupname"
>      Object Path > /org/openbmc/UserManager/Users
> @@ -60,16 +61,26 @@ class UserManGroups (dbus.service.Object):
>  
>      @dbus.service.method(INTF_NAME, "s", "x")
>      def GroupAddUsr (self, groupname):
> +        if not groupname : return 1
> +
> +        groups = self.GroupListAll ()
> +        if groupname in groups: return 1
> +
>          r = call (["addgroup", groupname])
>          return r
>  
>      @dbus.service.method(INTF_NAME, "s", "x")
>      def GroupAddSys (self, groupname):
> +        if not groupname : return 1
> +
> +        groups = self.GroupListAll ()
> +        if groupname in groups: return 1
> +
>          r = call (["addgroup", "-S", groupname])
>          return 0
>  
>      @dbus.service.method(INTF_NAME, "", "as")
> -    def GroupList (self):
> +    def GroupListUsr (self):
>          groupList = []
>          with open("/etc/group", "r") as f:
>              for grent in f:
> @@ -78,6 +89,23 @@ class UserManGroups (dbus.service.Object):
>                      groupList.append(groupParams[0])
>          return groupList
>  
> +    @dbus.service.method(INTF_NAME, "", "as")
> +    def GroupListSys (self):
> +        groupList = []
> +        with open("/etc/group", "r") as f:
> +            for grent in f:
> +                groupParams = grent.split (":")
> +                if (int(groupParams[2]) > 100 and int(groupParams[2]) < 1000): groupList.append(groupParams[0])
> +        return groupList

Why aren't you using an existing python module such as grp rather than
writing your own (likely buggy) parser?

It seems to have existed since at least python 2.6...
https://docs.python.org/2.6/library/grp.html

> @@ -111,39 +144,31 @@ class UserManUsers (dbus.service.Object):
>  
>      @dbus.service.method(INTF_NAME, "ssss", "x")
>      def UserAdd (self, gecos, username, groupname, passwd):
> +        if not username: return 1
> +
> +        users = self.UserList ()
> +        if username in users : return 1
> +
>          if groupname:
> -            cmd = "adduser "  + " -g "  + gecos + " -G ", groupname + " " + username
> +            groups = Groupsobj.GroupListAll ()
> +            if groupname not in groups: return 1
> +
> +        opts = ""
> +        if gecos: opts = " -g " + '"' + gecos + '"'
> +
> +        if groupname:
> +            cmd = "adduser "  + opts + " " + " -G " + groupname + " " + username
>          else:
> -            cmd = "adduser "  + " -g "  + gecos + username
> +            cmd = "adduser "  + opts + " " + username

I note there's a python-libuser package on ubuntu, is that a library
that could be used instead?

-- 
Stewart Smith
OPAL Architect, IBM.
