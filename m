Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com
 [IPv6:2607:f8b0:400e:c00::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 55CB81A0018
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jan 2016 16:23:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=mHGXNX8w; 
 dkim-atps=neutral
Received: by mail-pf0-x242.google.com with SMTP id 65so1289606pff.2
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jan 2016 21:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding;
 bh=okIDTCW+pMTLiH0mbXHzOZGA7DMPCnY/8XVQbpKEMnI=;
 b=mHGXNX8wRkq/Hmd4MhR5rIWIvfxblp2YmU/tKsFib/OYhz7yqjVgWXYjFf1Eraej+R
 hR1IIELSLErpBdKRb0sjyB/iI4Z+g6da76L71VQFb1ePxbICNsHm+C3c7Ttu1OKw3PHR
 NGOlU4+NvyBhWhXlQ+qnrgfeHBQ5d06eqW+Hvgusnu91Rs9r78YJVSr7essTnW9ByMVg
 w7QgDOsLfMAth/C3v/SyObTGuhJxYY3gVUw54gjrTmFpVPj0/1v/bOYHbJ3nPyU+Gts2
 L1vh2CtmfQQZg/R/igWPYfc26bKeh0crpihaXRF/nMZzAdmvbMQVNytn7VE1/PBmfTkL
 cJkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-type:content-transfer-encoding;
 bh=okIDTCW+pMTLiH0mbXHzOZGA7DMPCnY/8XVQbpKEMnI=;
 b=K1/ZHcvhzz7fxHrO4xfYR8/ZaEH/v2CBiRNUsUU6QJahenWxpLwwAcG5R64KPSRFi7
 JWgOOaeMpjvKuTAk3Vvgu+nDUpbkdRv0oxnOLkNz0kqHyOpurmLt63QrczBKddTaZ9fp
 IJIrD17f0ruKCqbnPltkJsO/+CyziUbotJGIEUgyzZDtewBwGYPxHdgDqutsPZhfChzx
 Sr0JeHypx8y2e4ZNg1dIgjLBmu7p1cT26+kFT8B7U1RI2XSNwbmwaVKD530wqMpl3a4a
 QlGLgR8XQggoC227xTgECZ2o8xiMQNPViA9tuYzjTFui33AkvjryxwiHdd9dxKtYv3YT
 V3Ow==
X-Gm-Message-State: ALoCoQlvs/tLYa6mOqByF53cgF8dpzyI13uFLHNRYeDoYBBHLqgdLKeF4o5+0a5fs8fnQMoFddGV9S+9BbWRZXd8FM37oxeplA==
X-Received: by 10.98.73.29 with SMTP id w29mr57614870pfa.106.1453353801224;
 Wed, 20 Jan 2016 21:23:21 -0800 (PST)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id c90sm52412068pfd.31.2016.01.20.21.23.19
 (version=TLSv1/SSLv3 cipher=OTHER);
 Wed, 20 Jan 2016 21:23:21 -0800 (PST)
Date: Thu, 21 Jan 2016 16:23:13 +1100
From: Cyril Bur <cyrilbur@gmail.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH openbmc] Dbus API for systemd/networkd for network
 configuration.
Message-ID: <20160121162313.6bb4a181@camb691>
In-Reply-To: <1453302622-24191-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1453302622-24191-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1453302622-24191-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Claws Mail 3.13.1 (GTK+ 2.24.29; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Thu, 21 Jan 2016 05:23:24 -0000

On Wed, 20 Jan 2016 09:10:22 -0600
OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:

> From: Hariharasubramanian R <hramasub@in.ibm.com>
> 

Hi Hariharasubramanian,

Just to be sure I've got this right, we're patching systemd now? Does systemd
not already do this? I thought the one good thing with systemd is that it
provides all this kind of stuff out of the box?

> ---
>  .../0100-systemd_networkd_dbus_setaddress.patch    | 845 +++++++++++++++++++++
>  .../meta/recipes-core/systemd/systemd_225.bb       |   1 +
>  2 files changed, 846 insertions(+)
>  create mode 100644 yocto-poky/meta/recipes-core/systemd/systemd/0100-systemd_networkd_dbus_setaddress.patch
> 
> diff --git a/yocto-poky/meta/recipes-core/systemd/systemd/0100-systemd_networkd_dbus_setaddress.patch b/yocto-poky/meta/recipes-core/systemd/systemd/0100-systemd_networkd_dbus_setaddress.patch
> new file mode 100644
> index 0000000..6727c1e
> --- /dev/null
> +++ b/yocto-poky/meta/recipes-core/systemd/systemd/0100-systemd_networkd_dbus_setaddress.patch
> @@ -0,0 +1,845 @@
> +From 35efeac7a1b1f6b737348f649d58d1c7eb5ecb8d Mon Sep 17 00:00:00 2001
> +From: Hariharasubramanian R <hramasub@in.ibm.com>
> +Date: Tue, 19 Jan 2016 05:04:40 -0600
> +Subject: [PATCH] Test
> +
> +---
> + src/network/networkd-link-bus.c           |  93 +++++
> + src/network/networkd-network-bus.c        | 556 ++++++++++++++++++++++++++++++
> + src/network/networkd-network.c            |  81 +++++
> + src/network/org.freedesktop.network1.conf |  17 +
> + 4 files changed, 747 insertions(+)
> +
> +diff --git a/src/network/networkd-link-bus.c b/src/network/networkd-link-bus.c
> +index 1a1524d..103d513 100644
> +--- a/src/network/networkd-link-bus.c
> ++++ b/src/network/networkd-link-bus.c
> +@@ -25,15 +25,41 @@
> + #include "networkd.h"
> + #include "networkd-link.h"
> + 
> ++#define SYSTEMD_NETWORKD_DBUS 1
> ++
> ++#ifdef SYSTEMD_NETWORKD_DBUS
> ++/*
> ++#include "hostname-util.h"
> ++#include "network-internal.h"
> ++#include "networkd-link.h"
> ++#include "bus-util.h"
> ++*/
> ++#include "sd-network.h"
> ++#include "sd-netlink.h"
> ++#include "socket-util.h"
> ++#include "ether-addr-util.h"
> ++/*
> ++#include "local-addresses.h"
> ++*/
> ++#endif
> ++
> + static BUS_DEFINE_PROPERTY_GET_ENUM(property_get_operational_state, link_operstate, LinkOperationalState);
> + static BUS_DEFINE_PROPERTY_GET_ENUM(property_get_administrative_state, link_state, LinkState);
> + 
> ++#ifdef SYSTEMD_NETWORKD_DBUS
> ++static int method_get_address (sd_bus_message *m, void* userdata, sd_bus_error *error);
> ++#endif
> ++
> + const sd_bus_vtable link_vtable[] = {
> +         SD_BUS_VTABLE_START(0),
> + 
> +         SD_BUS_PROPERTY("OperationalState", "s", property_get_operational_state, offsetof(Link, operstate), SD_BUS_VTABLE_PROPERTY_EMITS_CHANGE),
> +         SD_BUS_PROPERTY("AdministrativeState", "s", property_get_administrative_state, offsetof(Link, state), SD_BUS_VTABLE_PROPERTY_EMITS_CHANGE),
> + 
> ++#ifdef SYSTEMD_NETWORKD_DBUS
> ++	    /* device name */
> ++    	SD_BUS_METHOD("GetAddress", "s", "s", method_get_address, SD_BUS_VTABLE_UNPRIVILEGED),
> ++#endif
> +         SD_BUS_VTABLE_END
> + };
> + 
> +@@ -136,3 +162,70 @@ int link_send_changed(Link *link, const char *property, ...) {
> +                         "org.freedesktop.network1.Link",
> +                         l);
> + }
> ++
> ++static int method_get_address (sd_bus_message *m, void* userdata, sd_bus_error *error)
> ++{
> ++    _cleanup_netlink_unref_ sd_netlink                  *rtnl   = NULL;
> ++    _cleanup_netlink_message_unref_ sd_netlink_message  *req    = NULL;
> ++    _cleanup_netlink_message_unref_ sd_netlink_message  *reply  = NULL;
> ++    _cleanup_bus_message_unref_ sd_bus_message          *resp   = NULL;
> ++    Manager                                             *mgr    = userdata;
> ++
> ++    struct udev*        udev               = NULL;
> ++    struct udev_device* udev_eth           = NULL;
> ++    const char*         device             = NULL;
> ++    char                devpath [32]       = "/sys/class/net/"; 
> ++
> ++    int                 r;
> ++    unsigned char       ifindex;
> ++    bool                have_mac;
> ++    struct ether_addr   e;
> ++    char                ea[ETHER_ADDR_TO_STRING_MAX];
> ++
> ++    assert(m);
> ++    assert(mgr);
> ++
> ++    r = sd_bus_message_read (m, "s", &device);
> ++    if (r < 0)
> ++        return r;
> ++
> ++    if (isempty (device))
> ++        return sd_bus_error_setf(error, SD_BUS_ERROR_INVALID_ARGS, "Invalid Device Name.");
> ++
> ++    udev = udev_new();
> ++    udev_eth = udev_device_new_from_syspath(udev, strcat (devpath, device));
> ++    if (!udev_eth)
> ++        return sd_bus_error_setf(error, SD_BUS_ERROR_FAILED, "Could not find udev device");
> ++
> ++    ifindex = udev_device_get_ifindex(udev_eth);
> ++
> ++    r = sd_netlink_open(&rtnl);
> ++    if (r < 0)
> ++            return log_error_errno(r, "Failed to connect to netlink:"); /* fixme */
> ++
> ++    r = sd_rtnl_message_new_link(rtnl, &req, RTM_GETLINK, ifindex);
> ++    if (r < 0)
> ++            return r;
> ++
> ++    r = sd_netlink_call(rtnl, req, 0, &reply); /* fixme */
> ++    if (r < 0)
> ++            return r;
> ++
> ++    have_mac = sd_netlink_message_read_ether_addr(reply, IFLA_ADDRESS, &e) >= 0;
> ++    if (!have_mac)
> ++        return sd_bus_error_setf(error, SD_BUS_ERROR_FAILED, "Error reading IFLA address");
> ++
> ++    ether_addr_to_string(&e, ea);
> ++
> ++    r = sd_bus_message_new_method_return(m, &resp);
> ++    if (r < 0)
> ++        return sd_bus_error_setf(error, SD_BUS_ERROR_NO_MEMORY, "Error allocating reply messgage");
> ++
> ++    r = sd_bus_message_append(resp, "s", ea);
> ++    if (r < 0)
> ++        return sd_bus_error_setf(error, SD_BUS_ERROR_FAILED, "Error appending to reply messgage");
> ++
> ++    r = sd_bus_send(mgr->bus, resp, NULL);
> ++
> ++    return sd_bus_reply_method_return(m, "s", "Getting IFLA address ...");
> ++}
> +diff --git a/src/network/networkd-network-bus.c b/src/network/networkd-network-bus.c
> +index 5717a15..6f0d1e5 100644
> +--- a/src/network/networkd-network-bus.c
> ++++ b/src/network/networkd-network-bus.c
> +@@ -19,10 +19,34 @@
> +   along with systemd; If not, see <http://www.gnu.org/licenses/>.
> + ***/
> + 
> ++#define SYSTEMD_NETWORKD_DBUS 1
> ++
> ++#ifdef SYSTEMD_NETWORKD_DBUS
> ++#include <netinet/ether.h>
> ++#include <linux/if.h>
> ++#endif
> ++
> + #include "strv.h"
> + 
> + #include "networkd.h"
> + 
> ++#ifdef SYSTEMD_NETWORKD_DBUS
> ++#include "hostname-util.h"
> ++#include "network-internal.h"
> ++#include "networkd-link.h"
> ++#include "bus-util.h"
> ++
> ++#include "sd-network.h"
> ++#include "sd-netlink.h"
> ++#include "local-addresses.h"
> ++#endif
> ++
> ++#ifdef SYSTEMD_NETWORKD_DBUS
> ++int network_address_added_handler (sd_netlink* rtnl, sd_netlink_message* m, void* userdata);
> ++int network_rtnl_process_address(sd_netlink *rtnl, sd_netlink_message *message, void *userdata, Address* address); /* fixme */
> ++static int method_get_address (sd_bus_message *m, void* userdata, sd_bus_error *error); /* fixme */
> ++#endif
> ++
> + static int property_get_ether_addrs(
> +                 sd_bus *bus,
> +                 const char *path,
> +@@ -56,6 +80,11 @@ static int property_get_ether_addrs(
> +         return sd_bus_message_close_container(reply);
> + }
> + 
> ++#ifdef SYSTEMD_NETWORKD_DBUS
> ++static int method_add_address (sd_bus_message *m, void* userdata, sd_bus_error *error);
> ++static int method_del_address (sd_bus_message *m, void* userdata, sd_bus_error *error);
> ++#endif
> ++
> + const sd_bus_vtable network_vtable[] = {
> +         SD_BUS_VTABLE_START(0),
> + 
> +@@ -67,6 +96,13 @@ const sd_bus_vtable network_vtable[] = {
> +         SD_BUS_PROPERTY("MatchType", "as", NULL, offsetof(Network, match_type), SD_BUS_VTABLE_PROPERTY_CONST),
> +         SD_BUS_PROPERTY("MatchName", "as", NULL, offsetof(Network, match_name), SD_BUS_VTABLE_PROPERTY_CONST),
> + 
> ++#ifdef SYSTEMD_NETWORKD_DBUS
> ++	    /* device, IP, netmask, family, flags, scope, gateway */
> ++    	SD_BUS_METHOD("AddAddress", "sssyyys", "x", method_add_address, SD_BUS_VTABLE_UNPRIVILEGED),
> ++    	SD_BUS_METHOD("DelAddress", "sssyyys", "x", method_del_address, SD_BUS_VTABLE_UNPRIVILEGED),
> ++	    /* (family, prefixlen, flags, scope, IP)+ gateway */
> ++    	SD_BUS_METHOD("GetAddress", "s", "a(iyyus)s", method_get_address, SD_BUS_VTABLE_UNPRIVILEGED),
> ++#endif
> +         SD_BUS_VTABLE_END
> + };
> + 
> +@@ -152,3 +188,523 @@ int network_object_find(sd_bus *bus, const char *path, const char *interface, vo
> + 
> +         return 1;
> + }
> ++
> ++#ifdef SYSTEMD_NETWORKD_DBUS
> ++
> ++static int method_add_address (sd_bus_message *m, void* userdata, sd_bus_error *error)
> ++{
> ++    _cleanup_bus_message_unref_ sd_bus_message*         resp    = NULL;
> ++    _cleanup_netlink_unref_ sd_netlink*                 rtnl    = NULL;
> ++    _cleanup_netlink_message_unref_ sd_netlink_message* req     = NULL;
> ++    _cleanup_netlink_message_unref_ sd_netlink_message* reply   = NULL;
> ++    _cleanup_address_free_ Address *addr                        = NULL;
> ++    _cleanup_route_free_ Route *rt                              = NULL;
> ++    Manager *mgr                                                = userdata;
> ++    Link*               link               = NULL;
> ++    struct udev*        udev               = NULL;
> ++    struct udev_device* udev_eth           = NULL;
> ++
> ++    const char*         device             = NULL;
> ++    const char*         ipaddr             = NULL;
> ++    const char*         netmask            = NULL;
> ++    const char*         gateway            = NULL;
> ++    char                devpath [32]       = "/sys/class/net/"; 
> ++
> ++    unsigned char       family;
> ++    unsigned char       prefixlen;
> ++    unsigned char       flags;
> ++    unsigned char       scope;
> ++    unsigned char       ifindex;
> ++
> ++    struct in_addr      nm;
> ++    struct in_addr      ip;
> ++    struct in_addr      gw;
> ++    int r;
> ++
> ++    assert(m);
> ++    assert(mgr);
> ++
> ++    r = sd_bus_message_read (m, "sssyyys", &device, &ipaddr, &netmask, &family, &flags, &scope, &gateway);
> ++    if (r < 0)
> ++        return r;
> ++
> ++    if (isempty (device))
> ++        return sd_bus_error_setf(error, SD_BUS_ERROR_INVALID_ARGS, "Invalid Device Name.");
> ++
> ++    if (isempty (ipaddr))
> ++        return sd_bus_error_setf(error, SD_BUS_ERROR_INVALID_ARGS, "Invalid IP Address.");
> ++
> ++    if (isempty (netmask))
> ++        return sd_bus_error_setf(error, SD_BUS_ERROR_INVALID_ARGS, "Invalid IP Netmask.");
> ++
> ++    assert(family == AF_INET || family == AF_INET6);
> ++
> ++    udev = udev_new();
> ++    udev_eth = udev_device_new_from_syspath(udev, strcat (devpath, device));
> ++    if (!udev_eth)
> ++            return sd_bus_error_setf(error, SD_BUS_ERROR_FAILED, "Could not find udev device");
> ++
> ++    ifindex = udev_device_get_ifindex(udev_eth);
> ++
> ++    inet_aton (netmask, &nm);
> ++    inet_aton (ipaddr, &ip);
> ++    if (!isempty (gateway)) inet_aton (gateway, &gw);
> ++
> ++    prefixlen = in_addr_netmask_to_prefixlen(&nm);
> ++    assert(prefixlen > 0);
> ++
> ++    r = address_new_dynamic(&addr);
> ++    if (r < 0)
> ++        return sd_bus_error_setf(error, SD_BUS_ERROR_NO_MEMORY, "Error allocating new address");
> ++
> ++    r = sd_netlink_open(&rtnl);
> ++    if (r < 0)
> ++            return sd_bus_error_setf(error, SD_BUS_ERROR_IO_ERROR, "Failed to connect to netlink");
> ++
> ++    link = new0(Link, 1);
> ++    if (!link)
> ++            return -ENOMEM;
> ++
> ++    link->network = new0(Network, 1);
> ++    if (!link->network)
> ++            return sd_bus_error_setf(error, SD_BUS_ERROR_NO_MEMORY, "Could not alloc memory for Network");
> ++
> ++    link->n_ref                 = 1;
> ++    link->manager               = mgr;
> ++    link->manager->rtnl         = rtnl;
> ++    link->state                 = LINK_STATE_PENDING;
> ++    link->rtnl_extended_attrs   = true;
> ++    link->ifindex               = ifindex;
> ++    link->ifname                = strdup(device); /*FIXME:*/
> ++    if (!link->ifname)
> ++            return -ENOMEM;
> ++
> ++    addr->family                = family;
> ++    addr->in_addr.in.s_addr     = ip.s_addr;
> ++    addr->prefixlen             = prefixlen;
> ++    addr->broadcast.s_addr      = ip.s_addr | ~nm.s_addr;
> ++
> ++    if (!isempty (gateway))
> ++    {
> ++        r = route_new_dynamic(&rt, RTPROT_STATIC);
> ++        if (r < 0)
> ++            return r;
> ++
> ++        rt->protocol        = RTPROT_STATIC;
> ++        rt->network         = link->network;
> ++        rt->family          = family;
> ++        rt->scope           = RT_SCOPE_LINK;            /* FIXME: */
> ++        rt->dst_prefixlen   = 32;                       /* FIXME: AF_INET assumed */
> ++        rt->dst_addr.in     = gw;
> ++
> ++        LIST_PREPEND(routes, link->network->static_routes, rt);
> ++    }
> ++
> ++    /* send an nlmsg (RTM_NEWADDR) and append address to link address list */
> ++    r = address_update (addr, link, network_address_added_handler);
> ++    if (r < 0)
> ++        return r;
> ++
> ++    r = sd_bus_message_new_method_return(m, &resp);
> ++    if (r < 0)
> ++        return sd_bus_error_setf(error, SD_BUS_ERROR_NO_MEMORY, "Error allocating reply messgage");
> ++
> ++    r = sd_bus_message_append(resp, "x", 0);
> ++    if (r < 0)
> ++            return sd_bus_error_setf(error, SD_BUS_ERROR_FAILED, "Error appending to reply messgage");
> ++
> ++    r = sd_bus_send(mgr->bus, resp, NULL);
> ++    if (r < 0)
> ++            return sd_bus_error_setf(error, SD_BUS_ERROR_FAILED, "Error sending reply messgage");
> ++
> ++    return sd_bus_reply_method_return(m, "s", "Adding IP address...");
> ++}
> ++
> ++static int method_del_address (sd_bus_message *m, void* userdata, sd_bus_error *error)
> ++{
> ++    _cleanup_bus_message_unref_ sd_bus_message*         resp    = NULL;
> ++    _cleanup_netlink_unref_ sd_netlink*                 rtnl    = NULL;
> ++    _cleanup_netlink_message_unref_ sd_netlink_message* req     = NULL;
> ++    _cleanup_netlink_message_unref_ sd_netlink_message* reply   = NULL;
> ++    _cleanup_address_free_ Address *addr                        = NULL;
> ++    _cleanup_route_free_ Route *rt                              = NULL;
> ++    Manager *mgr                                                = userdata;
> ++    Link*               link               = NULL;
> ++    struct udev*        udev               = NULL;
> ++    struct udev_device* udev_eth           = NULL;
> ++
> ++    const char*         device             = NULL;
> ++    const char*         ipaddr             = NULL;
> ++    const char*         netmask            = NULL;
> ++    const char*         gateway            = NULL;
> ++    char                devpath [32]       = "/sys/class/net/"; 
> ++
> ++    unsigned char       family;
> ++    unsigned char       prefixlen;
> ++    unsigned char       flags;
> ++    unsigned char       scope;
> ++    unsigned char       ifindex;
> ++
> ++    struct in_addr      nm;
> ++    struct in_addr      ip;
> ++    struct in_addr      gw;
> ++    int r;
> ++
> ++    assert(m);
> ++    assert(mgr);
> ++
> ++    r = sd_bus_message_read (m, "sssyyys", &device, &ipaddr, &netmask, &family, &flags, &scope, &gateway);
> ++    if (r < 0)
> ++        return r;
> ++
> ++    if (isempty (device))
> ++        return sd_bus_error_setf(error, SD_BUS_ERROR_INVALID_ARGS, "Invalid Device Name.");
> ++
> ++    if (isempty (ipaddr))
> ++        return sd_bus_error_setf(error, SD_BUS_ERROR_INVALID_ARGS, "Invalid IP Address.");
> ++
> ++    if (isempty (netmask))
> ++        return sd_bus_error_setf(error, SD_BUS_ERROR_INVALID_ARGS, "Invalid IP Netmask.");
> ++
> ++    assert(family == AF_INET || family == AF_INET6);
> ++
> ++    udev = udev_new();
> ++    udev_eth = udev_device_new_from_syspath(udev, strcat (devpath, device));
> ++    if (!udev_eth)
> ++            return sd_bus_error_setf(error, SD_BUS_ERROR_FAILED, "Could not find udev device");
> ++
> ++    ifindex = udev_device_get_ifindex(udev_eth);
> ++
> ++    inet_aton (netmask, &nm);
> ++    inet_aton (ipaddr, &ip);
> ++    if (!isempty (gateway)) inet_aton (gateway, &gw);
> ++
> ++    prefixlen = in_addr_netmask_to_prefixlen(&nm);
> ++    assert(prefixlen > 0);
> ++
> ++    r = address_new_dynamic(&addr);
> ++    if (r < 0)
> ++        return sd_bus_error_setf(error, SD_BUS_ERROR_NO_MEMORY, "Error allocating new address");
> ++
> ++    r = sd_netlink_open(&rtnl);
> ++    if (r < 0)
> ++            return sd_bus_error_setf(error, SD_BUS_ERROR_IO_ERROR, "Failed to connect to netlink");
> ++
> ++    link = new0(Link, 1);
> ++    if (!link)
> ++            return -ENOMEM;
> ++
> ++    link->network = new0(Network, 1);
> ++    if (!link->network)
> ++            return sd_bus_error_setf(error, SD_BUS_ERROR_NO_MEMORY, "Could not alloc memory for Network");
> ++
> ++    link->n_ref                 = 1;
> ++    link->manager               = mgr;
> ++    link->manager->rtnl         = rtnl;
> ++    link->state                 = LINK_STATE_PENDING;
> ++    link->rtnl_extended_attrs   = true;
> ++    link->ifindex               = ifindex;
> ++    link->ifname                = strdup(device);
> ++    if (!link->ifname)
> ++            return -ENOMEM;
> ++
> ++    addr->family                = family;
> ++    addr->in_addr.in.s_addr     = ip.s_addr;
> ++    addr->prefixlen             = prefixlen;
> ++    addr->broadcast.s_addr      = ip.s_addr | ~nm.s_addr;
> ++
> ++    if (!isempty (gateway))
> ++    {
> ++        r = route_new_dynamic(&rt, RTPROT_STATIC);
> ++        if (r < 0)
> ++            return r;
> ++
> ++        rt->network         = link->network;
> ++        rt->family          = family;
> ++        rt->scope           = RT_SCOPE_LINK;            /* FIXME: */
> ++        rt->dst_prefixlen   = 32;                       /* FIXME: AF_INET assumed */
> ++        rt->dst_addr.in     = gw;
> ++
> ++        /*LIST_PREPEND(routes, link->network->static_routes, rt);*/
> ++        /* Drop the Gateway */
> ++        route_drop (rt, link, link_route_drop_handler);
> ++    }
> ++
> ++    /* send an nlmsg to delete address from address list */
> ++    r = address_drop(addr, link, link_address_drop_handler);
> ++    if (r < 0)
> ++        return r;
> ++
> ++    r = sd_bus_message_new_method_return(m, &resp);
> ++    if (r < 0)
> ++        return sd_bus_error_setf(error, SD_BUS_ERROR_NO_MEMORY, "Error allocating reply messgage");
> ++
> ++    r = sd_bus_message_append(resp, "x", 0);
> ++    if (r < 0)
> ++            return sd_bus_error_setf(error, SD_BUS_ERROR_FAILED, "Error appending to reply messgage");
> ++
> ++    r = sd_bus_send(mgr->bus, resp, NULL);
> ++    if (r < 0)
> ++            return sd_bus_error_setf(error, SD_BUS_ERROR_FAILED, "Error sending reply messgage");
> ++
> ++    return sd_bus_reply_method_return(m, "s", "Deleted IP address...");
> ++}
> ++
> ++static int method_get_address (sd_bus_message *m, void* userdata, sd_bus_error *error)
> ++{
> ++    _cleanup_netlink_unref_ sd_netlink  *rtnl   = NULL;
> ++    _cleanup_address_free_ Address      *addr   = NULL;
> ++    _cleanup_route_free_ Route          *rt     = NULL;
> ++    Manager                             *mgr    = userdata;
> ++#if 0 /* fixme: */
> ++    Link*               link               = NULL;
> ++#endif
> ++    struct udev*        udev               = NULL;
> ++    struct udev_device* udev_eth           = NULL;
> ++
> ++    const char*         device             = NULL;
> ++#if 0 /* fixme: */
> ++    const char*         ipaddr             = NULL;
> ++    const char*         netmask            = NULL;
> ++    const char*         gateway            = NULL;
> ++#endif
> ++    char                devpath [32]       = "/sys/class/net/"; 
> ++
> ++#if 0 /* fixme: */
> ++    unsigned char       family;
> ++    unsigned char       prefixlen;
> ++    unsigned char       flags;
> ++    unsigned char       scope;
> ++#endif
> ++    unsigned char       ifindex;
> ++
> ++#if 0 /* fixme: */
> ++    struct in_addr      nm;
> ++    struct in_addr      ip;
> ++    struct in_addr      gw;
> ++#endif
> ++    int                 r;
> ++
> ++    sd_netlink_message* maddr;
> ++
> ++    _cleanup_netlink_message_unref_ sd_netlink_message  *req    = NULL;
> ++    _cleanup_netlink_message_unref_ sd_netlink_message  *reply    = NULL;
> ++    _cleanup_bus_message_unref_ sd_bus_message  *resp   = NULL;
> ++    _cleanup_address_free_ Address              *address = NULL;
> ++    _cleanup_free_ struct local_address         *local   = NULL;
> ++    _cleanup_free_ char                         *ipr     = NULL;
> ++    _cleanup_free_ char                         *gwr     = NULL;
> ++    int                 n;
> ++    int                 i;
> ++
> ++    assert(m);
> ++    assert(mgr);
> ++
> ++    r = sd_bus_message_read (m, "s", &device);
> ++    if (r < 0)
> ++        return r;
> ++
> ++    if (isempty (device))
> ++        return sd_bus_error_setf(error, SD_BUS_ERROR_INVALID_ARGS, "Invalid Device Name.");
> ++
> ++    udev = udev_new();
> ++    udev_eth = udev_device_new_from_syspath(udev, strcat (devpath, device));
> ++    if (!udev_eth)
> ++        return sd_bus_error_setf(error, SD_BUS_ERROR_FAILED, "Could not find udev device");
> ++
> ++    ifindex = udev_device_get_ifindex(udev_eth);
> ++
> ++    r = sd_netlink_open(&rtnl);
> ++    if (r < 0)
> ++            return log_error_errno(r, "Failed to connect to netlink:"); /* fixme */
> ++
> ++    r = sd_rtnl_message_new_addr(rtnl, &req, RTM_GETADDR, 0, 0);
> ++    if (r < 0)
> ++            return r;
> ++
> ++    r = sd_netlink_message_request_dump(req, true);
> ++    if (r < 0)
> ++            return r;
> ++
> ++    r = sd_netlink_call(rtnl, req, 0, &reply); /* fixme */
> ++    if (r < 0)
> ++            return r;
> ++
> ++    r = sd_bus_message_new_method_return(m, &resp);
> ++    if (r < 0)
> ++        return sd_bus_error_setf(error, SD_BUS_ERROR_NO_MEMORY, "Error allocating reply messgage");
> ++
> ++    r = sd_bus_message_open_container(resp, 'a', "iyyus"); /*family,prefixlen,scope,flags,addr*/
> ++    if (r < 0)
> ++        return sd_bus_error_setf(error, SD_BUS_ERROR_NO_MEMORY, "Error opening a container for reply message");
> ++
> ++    for (maddr = reply; maddr; maddr = sd_netlink_message_next(maddr)) {
> ++            int k;
> ++
> ++            r = address_new_dynamic(&address);
> ++            if (r < 0)
> ++                    return r;
> ++
> ++            k = network_rtnl_process_address(rtnl, maddr, mgr, address);
> ++            if (k) {
> ++                r = sd_bus_message_append(resp, "i", address->family);
> ++                if (r < 0)
> ++                        return sd_bus_error_setf(error, SD_BUS_ERROR_FAILED, "Error appending to reply messgage");
> ++
> ++                r = sd_bus_message_append(resp, "y", address->prefixlen);
> ++                if (r < 0)
> ++                        return sd_bus_error_setf(error, SD_BUS_ERROR_FAILED, "Error appending to reply messgage");
> ++
> ++                r = sd_bus_message_append(resp, "y", address->scope);
> ++                if (r < 0)
> ++                        return sd_bus_error_setf(error, SD_BUS_ERROR_FAILED, "Error appending to reply messgage");
> ++
> ++                r = sd_bus_message_append(resp, "u", address->flags);
> ++                if (r < 0)
> ++                        return sd_bus_error_setf(error, SD_BUS_ERROR_FAILED, "Error appending to reply messgage");
> ++
> ++                r = in_addr_to_string(address->family, &address->in_addr, &ipr); /* fixme */
> ++                if (r < 0)
> ++                        return r;
> ++
> ++                r = sd_bus_message_append(resp, "s", ipr);
> ++                if (r < 0)
> ++                        return sd_bus_error_setf(error, SD_BUS_ERROR_FAILED, "Error appending to reply messgage");
> ++            }
> ++    }
> ++
> ++    r = sd_bus_message_close_container(resp);
> ++    if (r < 0)
> ++            return sd_bus_error_setf(error, SD_BUS_ERROR_FAILED, "Error closing reply container");
> ++
> ++    n = local_gateways(rtnl, ifindex, AF_UNSPEC, &local);
> ++    if (n < 0)
> ++            return n;
> ++
> ++    for (i = 0; i < n; i++) {
> ++
> ++            r = in_addr_to_string(local[i].family, &local[i].address, &gwr);
> ++            if (r < 0)
> ++                    return r;
> ++    }
> ++
> ++    r = sd_bus_message_append(resp, "s", gwr);
> ++    if (r < 0)
> ++            return sd_bus_error_setf(error, SD_BUS_ERROR_FAILED, "Error appending to reply messgage");
> ++
> ++    r = sd_bus_send(mgr->bus, resp, NULL);
> ++    if (r < 0)
> ++            return sd_bus_error_setf(error, SD_BUS_ERROR_FAILED, "Error sending reply messgage");
> ++
> ++    return sd_bus_reply_method_return(m, "s", "Getting IP configuration...");
> ++}
> ++
> ++
> ++int network_rtnl_process_address(sd_netlink *rtnl, sd_netlink_message *message, void *userdata, Address* address) {
> ++        Manager*        m       = (Manager*) userdata; /* fixme */
> ++#if 0 /* fixme */
> ++        Link*           link    = NULL;
> ++#endif
> ++        uint16_t        type;
> ++        unsigned char   flags;
> ++#if 0 /* fixme */
> ++        Address*        existing;
> ++#endif
> ++        char            buf[INET6_ADDRSTRLEN]; 
> ++#if 0 /* fixme */
> ++        char            valid_buf[FORMAT_TIMESPAN_MAX];
> ++        const char*     valid_str = NULL;
> ++#endif
> ++        int             ifindex;
> ++        int             r; 
> ++        /*_cleanup_address_free_ Address *address = NULL;*/
> ++        sd_bus_error err    = SD_BUS_ERROR_NULL; /* fixme */
> ++        sd_bus_error* error = &err;             /* fixme */
> ++
> ++        assert(rtnl);
> ++        assert(message);
> ++        assert(m);
> ++        assert(address);
> ++
> ++        if (sd_netlink_message_is_error(message)) {
> ++                r = sd_netlink_message_get_errno(message);
> ++                if (r < 0)
> ++                        sd_bus_error_setf(error, SD_BUS_ERROR_FAILED, "rtnl: failed to receive address: ");
> ++
> ++                return 0;
> ++        }
> ++
> ++        r = sd_netlink_message_get_type(message, &type);
> ++        if (r < 0) {
> ++                sd_bus_error_setf(error, SD_BUS_ERROR_FAILED, "rtnl: could not get message type: ");
> ++                return 0;
> ++        } else if (type != RTM_NEWADDR && type != RTM_DELADDR) {
> ++                sd_bus_error_setf(error, SD_BUS_ERROR_FAILED, "rtnl: received unexpected message type when processing address");
> ++                return 0;
> ++        }
> ++
> ++        r = sd_rtnl_message_addr_get_ifindex(message, &ifindex);
> ++        if (r < 0) {
> ++                sd_bus_error_setf(error, SD_BUS_ERROR_FAILED, "rtnl: could not get ifindex from address: %m");
> ++                return 0;
> ++        } else if (ifindex <= 0) {
> ++                sd_bus_error_setf(error, SD_BUS_ERROR_FAILED, "rtnl: received address message with invalid ifindex: %d", ifindex);
> ++                return 0;
> ++        } 
> ++
> ++        r = sd_rtnl_message_addr_get_family(message, &address->family); /* int : i*/
> ++        if (r < 0 || !IN_SET(address->family, AF_INET, AF_INET6)) {
> ++                sd_bus_error_setf(error, SD_BUS_ERROR_FAILED, "rtnl: received address with invalid family, ignoring.");
> ++                return 0;
> ++        }
> ++
> ++        r = sd_rtnl_message_addr_get_prefixlen(message, &address->prefixlen); /* uchar : byte : y */
> ++        if (r < 0) {
> ++                sd_bus_error_setf(error, SD_BUS_ERROR_FAILED, "rtnl: received address with invalid prefixlen, ignoring: ");
> ++                return 0;
> ++        }
> ++
> ++        r = sd_rtnl_message_addr_get_scope(message, &address->scope); /* uchar : byte : y*/
> ++        if (r < 0) {
> ++                sd_bus_error_setf(error, SD_BUS_ERROR_FAILED, "rtnl: received address with invalid scope, ignoring: ");
> ++                return 0;
> ++        }
> ++
> ++        r = sd_rtnl_message_addr_get_flags(message, &flags); /* uint32 : u*/
> ++        if (r < 0) {
> ++                sd_bus_error_setf(error, SD_BUS_ERROR_FAILED, "rtnl: received address with invalid flags, ignoring: ");
> ++                return 0;
> ++        }
> ++        address->flags = flags;
> ++
> ++        switch (address->family) {
> ++        case AF_INET:
> ++                r = sd_netlink_message_read_in_addr(message, IFA_LOCAL, &address->in_addr.in); /* ulong : uint64 : t */
> ++                if (r < 0) {
> ++                        sd_bus_error_setf(error, SD_BUS_ERROR_FAILED, "rtnl: received address without valid address, ignoring: ");
> ++                        return 0;
> ++                }
> ++
> ++                break;
> ++
> ++        case AF_INET6:
> ++                r = sd_netlink_message_read_in6_addr(message, IFA_ADDRESS, &address->in_addr.in6); /* ulong : uint64 : t */
> ++                if (r < 0) {
> ++                        sd_bus_error_setf(error, SD_BUS_ERROR_FAILED, "rtnl: received address without valid address, ignoring: ");
> ++                        return 0;
> ++                }
> ++
> ++                break;
> ++
> ++        default:
> ++                assert_not_reached("invalid address family");
> ++        }
> ++
> ++        if (!inet_ntop(address->family, &address->in_addr, buf, INET6_ADDRSTRLEN)) { /* string : s */
> ++                sd_bus_error_setf(error, SD_BUS_ERROR_FAILED, "Could not print address");
> ++                return 0;
> ++        }
> ++
> ++        return 1;
> ++}
> ++#endif
> +diff --git a/src/network/networkd-network.c b/src/network/networkd-network.c
> +index 6587ea9..2616c5b 100644
> +--- a/src/network/networkd-network.c
> ++++ b/src/network/networkd-network.c
> +@@ -32,6 +32,14 @@
> + #include "network-internal.h"
> + #include "dns-domain.h"
> + 
> ++#define SYSTEMD_NETWORKD_DBUS 1
> ++
> ++#ifdef SYSTEMD_NETWORKD_DBUS
> ++int network_address_added_handler (sd_netlink* rtnl, sd_netlink_message* m, void* userdata);
> ++int network_set_gateway (Link* link);
> ++static int route_handler(sd_netlink *rtnl, sd_netlink_message *m, void *userdata);
> ++#endif
> ++
> + static int network_load_one(Manager *manager, const char *filename) {
> +         _cleanup_network_free_ Network *network = NULL;
> +         _cleanup_fclose_ FILE *file = NULL;
> +@@ -850,3 +858,76 @@ int config_parse_hostname(const char *unit,
> + 
> +         return 0;
> + }
> ++
> ++#ifdef SYSTEMD_NETWORKD_DBUS
> ++int network_address_added_handler (sd_netlink* rtnl, sd_netlink_message* m, void* userdata)
> ++{
> ++        _cleanup_link_unref_ Link *link = userdata;
> ++        int r;
> ++
> ++        assert(link);
> ++
> ++        r = sd_netlink_message_get_errno(m);
> ++        if (r < 0 && r != -EEXIST) {
> ++                log_debug("Error in set IP address!");
> ++                link_enter_failed(link);
> ++        } else if (r >= 0)
> ++                link_rtnl_process_address(rtnl, m, link->manager);
> ++
> ++	network_set_gateway (link);
> ++
> ++	return 1;
> ++}
> ++
> ++/* link_enter_set_routes */
> ++int network_set_gateway (Link* link)
> ++{
> ++        Route *rt;
> ++        int r;
> ++
> ++        assert(link);
> ++        assert(link->network);
> ++        assert(link->state == LINK_STATE_SETTING_ADDRESSES);
> ++
> ++        link->state = LINK_STATE_SETTING_ROUTES;
> ++
> ++        LIST_FOREACH(routes, rt, link->network->static_routes) {
> ++                r = route_configure(rt, link, &route_handler);
> ++                if (r < 0) {
> ++                        log_debug ("Could not set Gateway!");
> ++                        link_enter_failed(link);
> ++                        return r;
> ++                }
> ++
> ++                link->link_messages ++;
> ++        }
> ++
> ++        if (link->link_messages == 0) {
> ++                link->static_configured = true;
> ++
> ++                /*link_enter_configured (link);*/
> ++                log_link_info(link, "Configured");
> ++                link->state = LINK_STATE_CONFIGURED;
> ++                link_save(link);
> ++        } else
> ++                log_debug("Setting Gateway");
> ++
> ++        return 0;
> ++}
> ++
> ++static int route_handler(sd_netlink *rtnl, sd_netlink_message *m, void *userdata) {
> ++        _cleanup_link_unref_ Link *link = userdata;
> ++        int r;
> ++
> ++        assert(link);
> ++
> ++        r = sd_netlink_message_get_errno(m);
> ++        if (r < 0 && r != -EEXIST) {
> ++                log_debug ("Could not set route! ");
> ++                link_enter_failed(link);
> ++        }
> ++
> ++        return 1;
> ++}
> ++
> ++#endif
> +diff --git a/src/network/org.freedesktop.network1.conf b/src/network/org.freedesktop.network1.conf
> +index 52dad33..f424b88 100644
> +--- a/src/network/org.freedesktop.network1.conf
> ++++ b/src/network/org.freedesktop.network1.conf
> +@@ -36,6 +36,23 @@
> +                        send_interface="org.freedesktop.DBus.Properties"
> +                        send_member="GetAll"/>
> + 
> ++                <allow send_destination="org.freedesktop.network1"
> ++                       send_interface="org.freedesktop.network1.Network"
> ++                       send_member="AddAddress"/>
> ++
> ++                <allow send_destination="org.freedesktop.network1"
> ++                       send_interface="org.freedesktop.network1.Network"
> ++                       send_member="DelAddress"/>
> ++
> ++                <allow send_destination="org.freedesktop.network1"
> ++                       send_interface="org.freedesktop.network1.Network"
> ++                       send_member="GetAddress"/>
> ++
> ++                <allow send_destination="org.freedesktop.network1"
> ++                       send_interface="org.freedesktop.network1.Link"
> ++                       send_member="GetAddress"/>
> ++
> ++
> +                 <allow receive_sender="org.freedesktop.network1"/>
> +         </policy>
> + 
> +-- 
> +1.8.2.2
> +
> diff --git a/yocto-poky/meta/recipes-core/systemd/systemd_225.bb b/yocto-poky/meta/recipes-core/systemd/systemd_225.bb
> index f7d4c7d..e3d55ec 100644
> --- a/yocto-poky/meta/recipes-core/systemd/systemd_225.bb
> +++ b/yocto-poky/meta/recipes-core/systemd/systemd_225.bb
> @@ -41,6 +41,7 @@ SRC_URI = "git://github.com/systemd/systemd.git;protocol=git \
>             file://0012-implment-systemd-sysv-install-for-OE.patch \
>             file://0014-Revert-rules-remove-firmware-loading-rules.patch \
>             file://0015-Revert-udev-remove-userspace-firmware-loading-suppor.patch \
> +           file://0100-systemd_networkd_dbus_setaddress.patch \
>             file://touchscreen.rules \
>             file://00-create-volatile.conf \
>             file://init \
