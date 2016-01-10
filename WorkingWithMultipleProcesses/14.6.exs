In the pmap code, I assigned the value of self to the variable me at the top of the method and then used me as the target of the message returned by the spawned processes. Why use a separate variable here?

Because the self in the fn passed to spawn_link, when evaluated, will
refer to the spawned process pid, not to the parent pid