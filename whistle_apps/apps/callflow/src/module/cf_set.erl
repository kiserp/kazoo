%%%-------------------------------------------------------------------
%%% @author James Aimonetti <>
%%% @copyright (C) 2012, James Aimonetti
%%% @doc
%%%
%%% @end
%%% Created : 11 Jan 2012 by James Aimonetti <>
%%%-------------------------------------------------------------------
-module(cf_set).

-export([handle/2]).

-include("../callflow.hrl").

-spec handle/2 :: (wh_json:json_object(), whapps_call:call()) -> 'ok'.
handle(Data, Call) ->
    Call1 = cf_exe:get_call(Call),
    Skills = wh_json:merge_recursive(whapps_call:kvs_fetch(cf_agent_skills, wh_json:new(), Call1), Data),
    cf_exe:set_call(whapps_call:kvs_store(cf_agent_skills, Skills, Call1)),
    cf_exe:continue().
